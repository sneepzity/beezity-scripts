#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Checking prerequisites...${NC}"

# Check if Rust is installed
if ! command -v rustc &> /dev/null; then
    echo -e "${YELLOW}Rust not found. Installing Rust...${NC}"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
fi

# Check if required packages are installed
echo -e "${YELLOW}Checking required packages...${NC}"
REQUIRED_PACKAGES="build-essential pkg-config libssl-dev"
for package in $REQUIRED_PACKAGES; do
    if ! dpkg -l | grep -q "^ii  $package "; then
        echo -e "${YELLOW}Installing $package...${NC}"
        sudo apt-get install -y "$package"
    fi
done

# Create temporary directory
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

# Download the application files
echo -e "${YELLOW}Downloading application files...${NC}"
curl -s https://raw.githubusercontent.com/sneepzity/beezity-scripts/main/beezity-ui/Cargo.toml -o Cargo.toml
mkdir -p src
curl -s https://raw.githubusercontent.com/sneepzity/beezity-scripts/main/beezity-ui/src/main.rs -o src/main.rs
curl -s https://raw.githubusercontent.com/sneepzity/beezity-scripts/main/beezity-ui/src/installer.rs -o src/installer.rs

# Build the application
echo -e "${YELLOW}Building application...${NC}"
cargo build --release

# Create ~/.local/bin if it doesn't exist
echo -e "${YELLOW}Installing application...${NC}"
mkdir -p "$HOME/.local/bin"

# Move the binary to ~/.local/bin
mv target/release/beezity-ui "$HOME/.local/bin/"

# Add ~/.local/bin to PATH if not already present
if ! grep -q "export PATH=\"\$HOME/.local/bin:\$PATH\"" "$HOME/.bashrc"; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
fi

if ! grep -q "export PATH=\"\$HOME/.local/bin:\$PATH\"" "$HOME/.zshrc" 2>/dev/null; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.zshrc"
fi

# Source the updated PATH
source "$HOME/.bashrc" 2>/dev/null || true
source "$HOME/.zshrc" 2>/dev/null || true

# Clean up
cd - > /dev/null
rm -rf "$TEMP_DIR"

echo -e "${GREEN}Installation complete! You can now run 'beezity-ui' from anywhere.${NC}"
echo -e "${YELLOW}Note: If you're using a different shell, you may need to restart your terminal for the PATH changes to take effect.${NC}" 