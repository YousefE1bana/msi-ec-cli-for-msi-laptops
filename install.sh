#!/bin/bash
# ==========================================
#  MSI EC Control Center - Installation Script
#  Author: Yousef Osama
#  Version: 1.0
# ==========================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Installation paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_TYPE="${1:-user}"  # user or system

if [ "$INSTALL_TYPE" = "system" ]; then
    INSTALL_DIR="/usr/local/bin"
    DESKTOP_DIR="/usr/share/applications"
    REQUIRES_SUDO=true
else
    INSTALL_DIR="$HOME/.local/bin"
    DESKTOP_DIR="$HOME/.local/share/applications"
    REQUIRES_SUDO=false
fi

CONFIG_DIR="$HOME/.config/msi-ec-control"

# Functions
print_header() {
    echo -e "${BLUE}"
    echo "============================================"
    echo "  MSI EC Control Center - Installation"
    echo "============================================"
    echo -e "${NC}"
}

print_step() {
    echo -e "${CYAN}[*]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

check_prerequisites() {
    print_step "Checking prerequisites..."

    # Check if MSI EC module is loaded
    if [ ! -d "/sys/devices/platform/msi-ec" ]; then
        print_warning "MSI EC kernel module not found!"
        echo "    Please install and load the msi-ec kernel module first."
        echo "    See INSTALLATION.md for instructions."
        read -p "    Continue anyway? (y/N) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    else
        print_success "MSI EC kernel module detected"
    fi

    # Check for notify-send (optional)
    if command -v notify-send &> /dev/null; then
        print_success "notify-send found (desktop notifications available)"
    else
        print_warning "notify-send not found (desktop notifications disabled)"
        echo "    Install libnotify for notification support:"
        echo "    - Debian/Ubuntu: sudo apt install libnotify-bin"
        echo "    - Arch: sudo pacman -S libnotify"
        echo "    - Fedora: sudo dnf install libnotify"
    fi

    # Check for required commands
    for cmd in tput sudo; do
        if ! command -v "$cmd" &> /dev/null; then
            print_error "Required command '$cmd' not found!"
            exit 1
        fi
    done

    print_success "All required dependencies found"
}

create_directories() {
    print_step "Creating directories..."

    # Create bin directory if it doesn't exist
    if [ ! -d "$INSTALL_DIR" ]; then
        mkdir -p "$INSTALL_DIR"
        print_success "Created $INSTALL_DIR"
    fi

    # Create desktop directory if it doesn't exist
    if [ ! -d "$DESKTOP_DIR" ]; then
        mkdir -p "$DESKTOP_DIR"
        print_success "Created $DESKTOP_DIR"
    fi

    # Create config directory
    if [ ! -d "$CONFIG_DIR" ]; then
        mkdir -p "$CONFIG_DIR"
        mkdir -p "$CONFIG_DIR/profiles"
        print_success "Created config directory: $CONFIG_DIR"
    fi
}

install_script() {
    print_step "Installing msi-ec-control script..."

    local source_file="$SCRIPT_DIR/msi-ec-control"
    local dest_file="$INSTALL_DIR/msi-ec-control"

    if [ ! -f "$source_file" ]; then
        print_error "Source file not found: $source_file"
        exit 1
    fi

    if [ "$REQUIRES_SUDO" = true ]; then
        sudo cp "$source_file" "$dest_file"
        sudo chmod 755 "$dest_file"
    else
        cp "$source_file" "$dest_file"
        chmod 755 "$dest_file"
    fi

    print_success "Installed to $dest_file"
}

install_config() {
    print_step "Installing configuration file..."

    local config_example="$SCRIPT_DIR/config.conf.example"
    local config_dest="$CONFIG_DIR/config.conf"

    if [ -f "$config_dest" ]; then
        print_warning "Config file already exists: $config_dest"
        echo "    Keeping existing configuration"
    else
        if [ -f "$config_example" ]; then
            cp "$config_example" "$config_dest"
            print_success "Created config file: $config_dest"
        else
            print_warning "Example config not found, skipping"
        fi
    fi
}

install_desktop_file() {
    print_step "Installing desktop integration..."

    local desktop_source="$SCRIPT_DIR/config/msi-control-center.desktop"
    local desktop_dest="$DESKTOP_DIR/msi-control-center.desktop"

    if [ -f "$desktop_source" ]; then
        # Create a modified version with correct path
        cat > "/tmp/msi-control-center.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=MSI EC Control
Comment=Complete control center for MSI laptops with all features
Exec=x-terminal-emulator -e "bash -c 'sudo $INSTALL_DIR/msi-ec-control; exec bash'"
Icon=applications-system
Terminal=true
Categories=System;Settings;HardwareSettings;
Keywords=msi;fan;performance;laptop;
EOF

        if [ "$REQUIRES_SUDO" = true ]; then
            sudo mv "/tmp/msi-control-center.desktop" "$desktop_dest"
            sudo chmod 644 "$desktop_dest"
        else
            mv "/tmp/msi-control-center.desktop" "$desktop_dest"
            chmod 644 "$desktop_dest"
        fi

        # Update desktop database if possible
        if command -v update-desktop-database &> /dev/null; then
            if [ "$REQUIRES_SUDO" = true ]; then
                sudo update-desktop-database "$DESKTOP_DIR" 2>/dev/null || true
            else
                update-desktop-database "$DESKTOP_DIR" 2>/dev/null || true
            fi
        fi

        print_success "Desktop file installed: $desktop_dest"
    else
        print_warning "Desktop file not found, skipping"
    fi
}

add_to_path() {
    if [ "$INSTALL_TYPE" = "user" ]; then
        if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
            print_warning "Installation directory not in PATH"
            echo "    Add this line to your ~/.bashrc or ~/.zshrc:"
            echo "    export PATH=\"\$HOME/.local/bin:\$PATH\""
        else
            print_success "Installation directory already in PATH"
        fi
    fi
}

print_completion() {
    echo ""
    echo -e "${GREEN}============================================${NC}"
    echo -e "${GREEN}  Installation Complete! ${NC}"
    echo -e "${GREEN}============================================${NC}"
    echo ""
    echo "Installation details:"
    echo "  • Script installed to: $INSTALL_DIR/msi-ec-control"
    echo "  • Config directory: $CONFIG_DIR"
    echo "  • Desktop file: $DESKTOP_DIR/msi-control-center.desktop"
    echo ""
    echo "Usage:"
    if [ "$INSTALL_TYPE" = "system" ]; then
        echo "  sudo msi-ec-control"
    else
        echo "  sudo $INSTALL_DIR/msi-ec-control"
    fi
    echo ""
    echo "Or search for 'MSI EC Control' in your application menu"
    echo ""
    echo "Configuration:"
    echo "  Edit $CONFIG_DIR/config.conf to customize settings"
    echo ""
    echo "Documentation:"
    echo "  README.md - Full feature documentation"
    echo "  INSTALLATION.md - Installation and troubleshooting"
    echo "  IMPROVEMENT_PLAN.md - Planned improvements"
    echo ""
}

uninstall() {
    print_header
    echo "This will remove MSI EC Control from your system."
    echo ""
    read -p "Are you sure you want to uninstall? (y/N) " -n 1 -r
    echo

    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Uninstall cancelled."
        exit 0
    fi

    print_step "Uninstalling MSI EC Control..."

    # Remove script
    if [ -f "$INSTALL_DIR/msi-ec-control" ]; then
        if [ "$REQUIRES_SUDO" = true ]; then
            sudo rm "$INSTALL_DIR/msi-ec-control"
        else
            rm "$INSTALL_DIR/msi-ec-control"
        fi
        print_success "Removed script"
    fi

    # Remove desktop file
    if [ -f "$DESKTOP_DIR/msi-control-center.desktop" ]; then
        if [ "$REQUIRES_SUDO" = true ]; then
            sudo rm "$DESKTOP_DIR/msi-control-center.desktop"
        else
            rm "$DESKTOP_DIR/msi-control-center.desktop"
        fi
        print_success "Removed desktop file"
    fi

    # Ask about config directory
    echo ""
    read -p "Remove configuration and profiles? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        if [ -d "$CONFIG_DIR" ]; then
            rm -rf "$CONFIG_DIR"
            print_success "Removed config directory"
        fi
    else
        echo "Keeping configuration at $CONFIG_DIR"
    fi

    echo ""
    print_success "Uninstall complete!"
}

# Main installation logic
main() {
    print_header

    case "${1:-install}" in
        install)
            if [ "${2:-user}" = "system" ]; then
                echo "Installing to system-wide location (/usr/local/bin)"
                echo "This requires sudo privileges."
                echo ""
            else
                echo "Installing to user location (~/.local/bin)"
                echo "This does not require sudo for installation."
                echo ""
            fi

            check_prerequisites
            create_directories
            install_script
            install_config
            install_desktop_file
            add_to_path
            print_completion
            ;;
        uninstall)
            uninstall
            ;;
        *)
            echo "Usage: $0 [install|uninstall] [user|system]"
            echo ""
            echo "Commands:"
            echo "  install user     - Install for current user (default)"
            echo "  install system   - Install system-wide (requires sudo)"
            echo "  uninstall        - Remove installation"
            echo ""
            echo "Examples:"
            echo "  $0                    # Install for current user"
            echo "  $0 install system     # Install system-wide"
            echo "  $0 uninstall          # Uninstall"
            exit 1
            ;;
    esac
}

main "$@"
