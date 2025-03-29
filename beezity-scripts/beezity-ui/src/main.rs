mod installer;

use anyhow::Result;
use crossterm::{
    event::{self, DisableMouseCapture, EnableMouseCapture, Event, KeyCode},
    execute,
    terminal::{disable_raw_mode, enable_raw_mode, EnterAlternateScreen, LeaveAlternateScreen},
};
use dialoguer::{theme::ColorfulTheme, Confirm, Select};
use indicatif::{ProgressBar, ProgressStyle};
use ratatui::{
    prelude::*,
    widgets::{Block, Borders, List, ListItem, Paragraph},
};
use std::{io, time::Duration};

use installer::Installer;

struct App {
    state: AppState,
    items: Vec<String>,
    current_index: usize,
    installer: Installer,
}

enum AppState {
    Menu,
    Confirmation,
    Installing,
}

impl App {
    fn new() -> Result<Self> {
        Ok(Self {
            state: AppState::Menu,
            items: vec![
                "Install Timeshift".to_string(),
                "Install Basic Requirements".to_string(),
                "Install Playonlinux".to_string(),
                "Install Media Apps (VLC, etc.)".to_string(),
                "Install Gaming Apps".to_string(),
                "Install Development Tools".to_string(),
                "Install Virtualization Tools".to_string(),
                "Install System Tools".to_string(),
                "Configure System Settings".to_string(),
                "Install Themes and Customizations".to_string(),
                "Update System".to_string(),
            ],
            current_index: 0,
            installer: Installer::new()?,
        })
    }

    fn install_selected(&mut self) -> Result<()> {
        match self.current_index {
            0 => self.installer.install_timeshift()?,
            1 => self.installer.install_basic_requirements()?,
            2 => self.installer.install_playonlinux()?,
            3 => self.installer.install_media_apps()?,
            4 => self.installer.install_gaming_apps()?,
            5 => self.installer.install_development_tools()?,
            6 => self.installer.install_virtualization_tools()?,
            7 => self.installer.install_system_tools()?,
            8 => self.installer.configure_system_settings()?,
            9 => self.installer.install_themes()?,
            10 => self.installer.update_system()?,
            _ => {}
        }
        Ok(())
    }
}

fn main() -> Result<()> {
    // Terminal initialization
    enable_raw_mode()?;
    let mut stdout = io::stdout();
    execute!(stdout, EnterAlternateScreen, EnableMouseCapture)?;
    let backend = CrosstermBackend::new(stdout);
    let mut terminal = Terminal::new(backend)?;

    // Create app and run it
    let app = App::new()?;
    let res = run_app(&mut terminal, app);

    // Restore terminal
    disable_raw_mode()?;
    execute!(
        terminal.backend_mut(),
        LeaveAlternateScreen,
        DisableMouseCapture
    )?;
    terminal.show_cursor()?;

    if let Err(err) = res {
        println!("{err:?}");
    }

    Ok(())
}

fn run_app<B: Backend>(terminal: &mut Terminal<B>, mut app: App) -> Result<()> {
    let tick_rate = Duration::from_millis(250);
    let mut last_tick = std::time::Instant::now();

    loop {
        terminal.draw(|f| ui(f, &app))?;
        let timeout = tick_rate
            .checked_sub(last_tick.elapsed())
            .unwrap_or_else(|| Duration::from_secs(0));
        if crossterm::event::poll(timeout)? {
            if let Event::Key(key) = event::read()? {
                match app.state {
                    AppState::Menu => match key.code {
                        KeyCode::Char('q') => return Ok(()),
                        KeyCode::Up => {
                            app.current_index = app.current_index.saturating_sub(1);
                            if app.current_index >= app.items.len() {
                                app.current_index = app.items.len().saturating_sub(1);
                            }
                        }
                        KeyCode::Down => {
                            app.current_index = app.current_index.saturating_add(1);
                            if app.current_index >= app.items.len() {
                                app.current_index = 0;
                            }
                        }
                        KeyCode::Enter => {
                            app.state = AppState::Confirmation;
                        }
                        _ => {}
                    },
                    AppState::Confirmation => {
                        if key.code == KeyCode::Char('y') {
                            app.state = AppState::Installing;
                            if let Err(e) = app.install_selected() {
                                eprintln!("Installation failed: {}", e);
                            }
                            app.state = AppState::Menu;
                        } else if key.code == KeyCode::Char('n') || key.code == KeyCode::Esc {
                            app.state = AppState::Menu;
                        }
                    }
                    AppState::Installing => {
                        if key.code == KeyCode::Char('q') {
                            return Ok(());
                        }
                    }
                }
            }
        }
        if last_tick.elapsed() >= tick_rate {
            last_tick = std::time::Instant::now();
        }
    }
}

fn ui<B: Backend>(f: &mut Frame<B>, app: &App) {
    let chunks = Layout::default()
        .direction(Direction::Vertical)
        .margin(1)
        .constraints([
            Constraint::Length(3),
            Constraint::Min(0),
        ])
        .split(f.size());

    let title = Paragraph::new("Beezity Ubuntu Setup")
        .block(Block::default().borders(Borders::ALL).title("Setup Menu"))
        .style(Style::default().fg(Color::Cyan))
        .alignment(Alignment::Center);

    f.render_widget(title, chunks[0]);

    match app.state {
        AppState::Menu => {
            let items: Vec<ListItem> = app
                .items
                .iter()
                .map(|&i| ListItem::new(i.to_string()))
                .collect();

            let list = List::new(items)
                .block(Block::default().borders(Borders::ALL).title("Options"))
                .highlight_style(Style::default().bg(Color::DarkGray))
                .highlight_symbol("> ");

            f.render_stateful_widget(
                list,
                chunks[1],
                &mut ListState::default().with_selected(Some(app.current_index)),
            );
        }
        AppState::Confirmation => {
            let confirm = Paragraph::new(format!(
                "Install {}? (y/n)",
                app.items[app.current_index]
            ))
            .block(Block::default().borders(Borders::ALL).title("Confirmation"))
            .alignment(Alignment::Center);

            f.render_widget(confirm, chunks[1]);
        }
        AppState::Installing => {
            let progress = Paragraph::new("Installing...")
                .block(Block::default().borders(Borders::ALL).title("Progress"))
                .alignment(Alignment::Center);

            f.render_widget(progress, chunks[1]);
        }
    }
}
