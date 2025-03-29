#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Starting Beezity UI installation...${NC}"

# Create a temporary file for the installation script
TEMP_SCRIPT=$(mktemp)
if ! curl -s https://raw.githubusercontent.com/sneepzity/beezity-scripts/main/beezity-ui/install.sh > "$TEMP_SCRIPT"; then
    echo -e "${RED}Failed to download installation script${NC}"
    exit 1
fi

chmod +x "$TEMP_SCRIPT"

# Run the installation script
if ! "$TEMP_SCRIPT"; then
    echo -e "${RED}Installation failed${NC}"
    rm "$TEMP_SCRIPT"
    exit 1
fi

# Clean up
rm "$TEMP_SCRIPT"

# Wait a moment for PATH to update
sleep 1

# Try to run the application
echo -e "${GREEN}Installation complete! Starting Beezity UI...${NC}"
if command -v beezity-ui &> /dev/null; then
    beezity-ui
else
    echo -e "${RED}Failed to find beezity-ui in PATH${NC}"
    echo -e "${YELLOW}Trying to run directly from ~/.local/bin...${NC}"
    if [ -f "$HOME/.local/bin/beezity-ui" ]; then
        "$HOME/.local/bin/beezity-ui"
    else
        echo -e "${RED}Could not find beezity-ui. Please try running it manually after restarting your terminal.${NC}"
        exit 1
    fi
fi 