#!/bin/bash
# ==========================================
#  MSI EC Control Center - Installation Script
#  Author: Yousef Osama
#  Version: 2.0.0
# ==========================================

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Configuration
INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/bin}"
DESKTOP_DIR="$HOME/.local/share/applications"
SCRIPT_NAME="msi-ec-control"

echo -e "${CYAN}╔════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║   MSI EC Control Center - Installation    ║${NC}"
echo -e "${CYAN}║              Version 2.0.0                 ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════╝${NC}"
echo

# Check if msi-ec module is loaded
echo -e "${BLUE}[1/6]${NC} Checking MSI EC kernel module..."
if [ ! -d "/sys/devices/platform/msi-ec" ]; then
    echo -e "${YELLOW}⚠️  Warning: MSI EC kernel module not found${NC}"
    echo -e "    The msi-ec kernel module is not currently loaded."
    echo -e "    You need to install it before using this control center."
    echo
    echo -e "    Installation steps:"
    echo -e "    1. See INSTALLATION.md for detailed instructions"
    echo -e "    2. Or visit: https://github.com/YousefE1bana/msi-ec-for-msi-laptops"
    echo
    read -p "    Continue installation anyway? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${RED}Installation cancelled.${NC}"
        exit 1
    fi
else
    echo -e "${GREEN}✓${NC} MSI EC kernel module is loaded"
fi

# Create installation directory
echo -e "${BLUE}[2/6]${NC} Creating installation directory..."
mkdir -p "$INSTALL_DIR"
echo -e "${GREEN}✓${NC} Directory: $INSTALL_DIR"

# Install main script
echo -e "${BLUE}[3/6]${NC} Installing msi-ec-control script..."
if [ ! -f "$SCRIPT_NAME" ]; then
    echo -e "${RED}✗ Error: $SCRIPT_NAME not found in current directory${NC}"
    echo -e "  Please run this script from the repository root."
    exit 1
fi

cp "$SCRIPT_NAME" "$INSTALL_DIR/"
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"
echo -e "${GREEN}✓${NC} Installed to: $INSTALL_DIR/$SCRIPT_NAME"

# Check if install directory is in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo -e "${YELLOW}⚠️  Note: $INSTALL_DIR is not in your PATH${NC}"
    echo -e "    Add this line to your ~/.bashrc or ~/.zshrc:"
    echo -e "    ${CYAN}export PATH=\"\$HOME/.local/bin:\$PATH\"${NC}"
    echo
fi

# Install desktop shortcut
echo -e "${BLUE}[4/6]${NC} Installing desktop shortcut..."
mkdir -p "$DESKTOP_DIR"

# Create desktop file with correct path
cat > "$DESKTOP_DIR/msi-control-center.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=MSI EC Control
Comment=Complete control center for MSI laptops with all features
Exec=x-terminal-emulator -e "bash -c 'sudo $INSTALL_DIR/$SCRIPT_NAME; exec bash'"
Icon=applications-system
Terminal=true
Categories=System;Settings;HardwareSettings;
Keywords=msi;fan;performance;laptop;
EOF

chmod +x "$DESKTOP_DIR/msi-control-center.desktop"
echo -e "${GREEN}✓${NC} Desktop shortcut installed"

# Optionally copy to desktop
echo -e "${BLUE}[5/6]${NC} Desktop shortcut options..."
read -p "    Copy shortcut to desktop? (y/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [ -d "$HOME/Desktop" ]; then
        cp "$DESKTOP_DIR/msi-control-center.desktop" "$HOME/Desktop/"
        chmod +x "$HOME/Desktop/msi-control-center.desktop"
        echo -e "${GREEN}✓${NC} Shortcut copied to desktop"
    else
        echo -e "${YELLOW}⚠️  Desktop directory not found${NC}"
    fi
else
    echo -e "  Skipped desktop copy"
fi

# Test installation
echo -e "${BLUE}[6/6]${NC} Testing installation..."
if command -v "$SCRIPT_NAME" &> /dev/null; then
    VERSION=$("$SCRIPT_NAME" --version 2>/dev/null || echo "unknown")
    echo -e "${GREEN}✓${NC} Installation successful! ($VERSION)"
else
    if [ -x "$INSTALL_DIR/$SCRIPT_NAME" ]; then
        VERSION=$("$INSTALL_DIR/$SCRIPT_NAME" --version 2>/dev/null || echo "unknown")
        echo -e "${GREEN}✓${NC} Installation successful! ($VERSION)"
        echo -e "${YELLOW}⚠️  Note: Command not in PATH. Use full path to run.${NC}"
    else
        echo -e "${RED}✗${NC} Installation may have issues"
    fi
fi

# Final instructions
echo
echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║         Installation Complete! 🎉          ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
echo
echo -e "${CYAN}How to use:${NC}"
echo

if [[ ":$PATH:" == *":$INSTALL_DIR:"* ]]; then
    echo -e "  1. ${GREEN}From terminal:${NC}"
    echo -e "     ${CYAN}sudo $SCRIPT_NAME${NC}"
    echo
else
    echo -e "  1. ${GREEN}From terminal (full path):${NC}"
    echo -e "     ${CYAN}sudo $INSTALL_DIR/$SCRIPT_NAME${NC}"
    echo
    echo -e "     ${YELLOW}Or add to PATH and use:${NC}"
    echo -e "     ${CYAN}sudo $SCRIPT_NAME${NC}"
    echo
fi

echo -e "  2. ${GREEN}From applications menu:${NC}"
echo -e "     Search for \"MSI EC Control\""
echo

if [ -f "$HOME/Desktop/msi-control-center.desktop" ]; then
    echo -e "  3. ${GREEN}From desktop:${NC}"
    echo -e "     Double-click the \"MSI EC Control\" icon"
    echo
fi

echo -e "${CYAN}Quick commands:${NC}"
echo -e "  ${CYAN}$SCRIPT_NAME --help${NC}       Show help"
echo -e "  ${CYAN}$SCRIPT_NAME --version${NC}    Show version"
echo -e "  ${CYAN}sudo $SCRIPT_NAME${NC}         Run interactive menu"
echo

echo -e "${CYAN}Documentation:${NC}"
echo -e "  README.md           User guide and features"
echo -e "  INSTALLATION.md     Kernel module setup"
echo -e "  CONTRIBUTING.md     How to contribute"
echo

echo -e "${YELLOW}Important:${NC}"
echo -e "  • Always run with ${CYAN}sudo${NC} for hardware control"
echo -e "  • Ensure msi-ec kernel module is loaded"
echo -e "  • Check INSTALLATION.md if module is not loaded"
echo

echo -e "${GREEN}Enjoy controlling your MSI laptop! 🚀${NC}"
echo
