use anyhow::Result;
use std::process::Command;
use indicatif::{ProgressBar, ProgressStyle};

pub struct Installer {
    user: String,
}

impl Installer {
    pub fn new() -> Result<Self> {
        let user = std::env::var("USER")?;
        Ok(Self { user })
    }

    pub fn install_timeshift(&self) -> Result<()> {
        let pb = ProgressBar::new(1);
        pb.set_style(ProgressStyle::default_spinner());
        pb.set_message("Installing Timeshift...");
        
        Command::new("sudo")
            .args(["apt-get", "-y", "install", "timeshift"])
            .output()?;
            
        pb.finish_with_message("Timeshift installed!");
        Ok(())
    }

    pub fn install_basic_requirements(&self) -> Result<()> {
        let pb = ProgressBar::new(1);
        pb.set_style(ProgressStyle::default_spinner());
        pb.set_message("Installing basic requirements...");
        
        Command::new("sudo")
            .args(["apt-get", "update", "-y"])
            .output()?;
            
        Command::new("sudo")
            .args(["apt-get", "install", "-y", "curl", "build-essential", "wget"])
            .output()?;
            
        pb.finish_with_message("Basic requirements installed!");
        Ok(())
    }

    pub fn install_playonlinux(&self) -> Result<()> {
        let pb = ProgressBar::new(1);
        pb.set_style(ProgressStyle::default_spinner());
        pb.set_message("Installing Playonlinux...");
        
        Command::new("sudo")
            .args(["apt-get", "-y", "install", "playonlinux", "winbind"])
            .output()?;
            
        pb.finish_with_message("Playonlinux installed!");
        Ok(())
    }

    pub fn install_media_apps(&self) -> Result<()> {
        let pb = ProgressBar::new(1);
        pb.set_style(ProgressStyle::default_spinner());
        pb.set_message("Installing media apps...");
        
        // Install VLC
        Command::new("flatpak")
            .args(["install", "--assumeyes", "--noninteractive", "--user", "org.videolan.VLC"])
            .output()?;
            
        // Install other media apps...
        
        pb.finish_with_message("Media apps installed!");
        Ok(())
    }

    pub fn install_gaming_apps(&self) -> Result<()> {
        let pb = ProgressBar::new(1);
        pb.set_style(ProgressStyle::default_spinner());
        pb.set_message("Installing gaming apps...");
        
        // Install Steam
        Command::new("flatpak")
            .args(["install", "--assumeyes", "--noninteractive", "--user", "com.valvesoftware.Steam"])
            .output()?;
            
        // Install other gaming apps...
        
        pb.finish_with_message("Gaming apps installed!");
        Ok(())
    }

    pub fn install_development_tools(&self) -> Result<()> {
        let pb = ProgressBar::new(1);
        pb.set_style(ProgressStyle::default_spinner());
        pb.set_message("Installing development tools...");
        
        // Install VS Code
        Command::new("flatpak")
            .args(["install", "--assumeyes", "--noninteractive", "--user", "com.visualstudio.code"])
            .output()?;
            
        // Install other development tools...
        
        pb.finish_with_message("Development tools installed!");
        Ok(())
    }

    pub fn install_virtualization_tools(&self) -> Result<()> {
        let pb = ProgressBar::new(1);
        pb.set_style(ProgressStyle::default_spinner());
        pb.set_message("Installing virtualization tools...");
        
        // Install QEMU and Virt-Manager
        Command::new("sudo")
            .args(["apt-get", "install", "-y", "dkms", "virt-manager", "virt-viewer", "aria2"])
            .output()?;
            
        // Install other virtualization tools...
        
        pb.finish_with_message("Virtualization tools installed!");
        Ok(())
    }

    pub fn install_system_tools(&self) -> Result<()> {
        let pb = ProgressBar::new(1);
        pb.set_style(ProgressStyle::default_spinner());
        pb.set_message("Installing system tools...");
        
        // Install Nala
        Command::new("curl")
            .args(["https://gitlab.com/volian/volian-archive/-/raw/main/install-nala.sh"])
            .output()?;
            
        // Install other system tools...
        
        pb.finish_with_message("System tools installed!");
        Ok(())
    }

    pub fn configure_system_settings(&self) -> Result<()> {
        let pb = ProgressBar::new(1);
        pb.set_style(ProgressStyle::default_spinner());
        pb.set_message("Configuring system settings...");
        
        // Configure GNOME settings
        Command::new("gsettings")
            .args(["set", "org.gnome.desktop.interface", "clock-format", "12h"])
            .output()?;
            
        // Configure other system settings...
        
        pb.finish_with_message("System settings configured!");
        Ok(())
    }

    pub fn install_themes(&self) -> Result<()> {
        let pb = ProgressBar::new(1);
        pb.set_style(ProgressStyle::default_spinner());
        pb.set_message("Installing themes and customizations...");
        
        // Install Catppuccin theme
        Command::new("git")
            .args(["clone", "https://github.com/MFactor1/AlpsCatppuccin.git"])
            .output()?;
            
        // Install other themes...
        
        pb.finish_with_message("Themes and customizations installed!");
        Ok(())
    }

    pub fn update_system(&self) -> Result<()> {
        let pb = ProgressBar::new(1);
        pb.set_style(ProgressStyle::default_spinner());
        pb.set_message("Updating system...");
        
        Command::new("sudo")
            .args(["apt-get", "-y", "update"])
            .output()?;
            
        Command::new("sudo")
            .args(["apt-get", "-y", "upgrade"])
            .output()?;
            
        Command::new("flatpak")
            .args(["update", "--assumeyes", "--noninteractive"])
            .output()?;
            
        pb.finish_with_message("System updated!");
        Ok(())
    }
} 