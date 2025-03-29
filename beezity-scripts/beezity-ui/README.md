# Beezity Ubuntu Setup UI

A modern, Rust-based terminal user interface for the Beezity Ubuntu setup script. This version provides a more user-friendly interface with cursor support and improved interaction.

## Features

- Modern terminal user interface with cursor support
- Progress indicators for installations
- Organized menu structure
- Yes/No confirmation dialogs
- Progress bars for long-running operations
- Error handling and reporting

## Prerequisites

- Rust (latest stable version)
- Ubuntu 22.04 or later
- sudo privileges
- Internet connection

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/beezity-scripts.git
cd beezity-scripts/beezity-ui
```

2. Build the project:
```bash
cargo build --release
```

3. Run the application:
```bash
cargo run --release
```

## Usage

1. Use the Up/Down arrow keys to navigate through the menu options
2. Press Enter to select an option
3. Confirm with 'y' or cancel with 'n' when prompted
4. Press 'q' at any time to quit the application

## Menu Options

1. Install Timeshift
2. Install Basic Requirements
3. Install Playonlinux
4. Install Media Apps (VLC, etc.)
5. Install Gaming Apps
6. Install Development Tools
7. Install Virtualization Tools
8. Install System Tools
9. Configure System Settings
10. Install Themes and Customizations
11. Update System

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details. 