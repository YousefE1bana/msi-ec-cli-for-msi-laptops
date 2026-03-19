#!/bin/bash
# ==========================================
#  MSI EC Control - System Validation Script
#  Author: Yousef Osama
#  Version: 2.0.0
# ==========================================

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}╔════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║   MSI EC Control - System Validation      ║${NC}"
echo -e "${CYAN}║              Version 2.0.0                 ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════╝${NC}"
echo

# System Information
echo -e "${CYAN}System Information:${NC}"
if [ -f /etc/os-release ]; then
    OS_NAME=$(grep PRETTY_NAME /etc/os-release | cut -d'"' -f2)
    echo -e "  OS: ${GREEN}$OS_NAME${NC}"
else
    echo -e "  OS: ${YELLOW}Unknown${NC}"
fi
echo -e "  Kernel: ${GREEN}$(uname -r)${NC}"
echo -e "  Architecture: ${GREEN}$(uname -m)${NC}"
echo

# Check kernel module
echo -e "${CYAN}Checking MSI EC Kernel Module:${NC}"
echo -n "  Module loaded: "
if lsmod | grep -q msi_ec; then
    echo -e "${GREEN}✓ Yes${NC}"
    MODULE_INFO=$(modinfo msi-ec 2>/dev/null | grep -E "^(version|author|description):" || echo "")
    if [ -n "$MODULE_INFO" ]; then
        echo -e "${GREEN}$MODULE_INFO${NC}" | sed 's/^/    /'
    fi
else
    echo -e "${RED}✗ No${NC}"
    echo -e "    ${YELLOW}The msi-ec kernel module is not loaded.${NC}"
    echo -e "    ${YELLOW}Run: sudo modprobe msi-ec${NC}"
    echo -e "    ${YELLOW}Or see INSTALLATION.md for setup instructions${NC}"
fi
echo

# Check sysfs interface
echo -e "${CYAN}Checking sysfs Interface:${NC}"
echo -n "  Base path: "
if [ -d "/sys/devices/platform/msi-ec" ]; then
    echo -e "${GREEN}✓ Available${NC}"
    echo -e "    ${GREEN}/sys/devices/platform/msi-ec${NC}"

    # Check individual files
    echo -e "\n  ${CYAN}Control Files:${NC}"

    echo -n "    fan_mode: "
    [ -r "/sys/devices/platform/msi-ec/fan_mode" ] && echo -e "${GREEN}✓ Readable${NC}" || echo -e "${RED}✗ Not found${NC}"

    echo -n "    shift_mode: "
    [ -r "/sys/devices/platform/msi-ec/shift_mode" ] && echo -e "${GREEN}✓ Readable${NC}" || echo -e "${RED}✗ Not found${NC}"

    echo -n "    cooler_boost: "
    [ -r "/sys/devices/platform/msi-ec/cooler_boost" ] && echo -e "${GREEN}✓ Readable${NC}" || echo -e "${RED}✗ Not found${NC}"

    echo -n "    super_battery: "
    [ -r "/sys/devices/platform/msi-ec/super_battery" ] && echo -e "${GREEN}✓ Readable${NC}" || echo -e "${YELLOW}⚠ Not found (may not be supported)${NC}"

    echo -n "    webcam: "
    [ -r "/sys/devices/platform/msi-ec/webcam" ] && echo -e "${GREEN}✓ Readable${NC}" || echo -e "${YELLOW}⚠ Not found (may not be supported)${NC}"

    echo -e "\n  ${CYAN}Temperature Sensors:${NC}"

    echo -n "    CPU temp: "
    if [ -r "/sys/devices/platform/msi-ec/cpu/realtime_temperature" ]; then
        CPU_TEMP=$(cat /sys/devices/platform/msi-ec/cpu/realtime_temperature 2>/dev/null || echo "N/A")
        echo -e "${GREEN}✓ Readable${NC} (Current: ${CPU_TEMP}°C)"
    else
        echo -e "${RED}✗ Not found${NC}"
    fi

    echo -n "    GPU temp: "
    if [ -r "/sys/devices/platform/msi-ec/gpu/realtime_temperature" ]; then
        GPU_TEMP=$(cat /sys/devices/platform/msi-ec/gpu/realtime_temperature 2>/dev/null || echo "N/A")
        echo -e "${GREEN}✓ Readable${NC} (Current: ${GPU_TEMP}°C)"
    else
        echo -e "${RED}✗ Not found${NC}"
    fi

    echo -e "\n  ${CYAN}Fan Speed:${NC}"

    echo -n "    CPU fan: "
    if [ -r "/sys/devices/platform/msi-ec/cpu/realtime_fan_speed" ]; then
        CPU_FAN=$(cat /sys/devices/platform/msi-ec/cpu/realtime_fan_speed 2>/dev/null || echo "N/A")
        echo -e "${GREEN}✓ Readable${NC} (Current: ${CPU_FAN} RPM)"
    else
        echo -e "${YELLOW}⚠ Not found${NC}"
    fi

    echo -n "    GPU fan: "
    if [ -r "/sys/devices/platform/msi-ec/gpu/realtime_fan_speed" ]; then
        GPU_FAN=$(cat /sys/devices/platform/msi-ec/gpu/realtime_fan_speed 2>/dev/null || echo "N/A")
        echo -e "${GREEN}✓ Readable${NC} (Current: ${GPU_FAN} RPM)"
    else
        echo -e "${YELLOW}⚠ Not found${NC}"
    fi
else
    echo -e "${RED}✗ Not available${NC}"
    echo -e "    ${YELLOW}The sysfs interface is not available.${NC}"
    echo -e "    ${YELLOW}This usually means the kernel module is not loaded.${NC}"
fi
echo

# Check control script
echo -e "${CYAN}Checking MSI EC Control Script:${NC}"
echo -n "  Script location: "
if [ -x "./msi-ec-control" ]; then
    echo -e "${GREEN}✓ Found in current directory${NC}"
    SCRIPT_VERSION=$(./msi-ec-control --version 2>/dev/null || echo "unknown")
    echo -e "    Version: ${GREEN}$SCRIPT_VERSION${NC}"
elif command -v msi-ec-control &> /dev/null; then
    SCRIPT_PATH=$(command -v msi-ec-control)
    echo -e "${GREEN}✓ Found in PATH${NC}"
    echo -e "    Path: ${GREEN}$SCRIPT_PATH${NC}"
    SCRIPT_VERSION=$(msi-ec-control --version 2>/dev/null || echo "unknown")
    echo -e "    Version: ${GREEN}$SCRIPT_VERSION${NC}"
else
    echo -e "${YELLOW}⚠ Not found${NC}"
    echo -e "    ${YELLOW}Script not in current directory or PATH${NC}"
    echo -e "    ${YELLOW}Run ./install.sh to install it${NC}"
fi
echo

# Check configuration directory
echo -e "${CYAN}Checking Configuration:${NC}"
CONFIG_DIR="$HOME/.config/msi-ec-control"
echo -n "  Config directory: "
if [ -d "$CONFIG_DIR" ]; then
    echo -e "${GREEN}✓ Exists${NC}"
    echo -e "    ${GREEN}$CONFIG_DIR${NC}"

    if [ -f "$CONFIG_DIR/history.log" ]; then
        HISTORY_LINES=$(wc -l < "$CONFIG_DIR/history.log" 2>/dev/null || echo "0")
        echo -e "    History log: ${GREEN}✓${NC} ($HISTORY_LINES entries)"
    else
        echo -e "    History log: ${YELLOW}⚠ Not created yet${NC}"
    fi

    if [ -d "$CONFIG_DIR/profiles" ]; then
        PROFILE_COUNT=$(ls -1 "$CONFIG_DIR/profiles"/*.profile 2>/dev/null | wc -l)
        echo -e "    Profiles: ${GREEN}✓${NC} ($PROFILE_COUNT saved)"
    else
        echo -e "    Profiles: ${YELLOW}⚠ Directory not created yet${NC}"
    fi
else
    echo -e "${YELLOW}⚠ Not created yet${NC}"
    echo -e "    ${YELLOW}Will be created on first run${NC}"
fi
echo

# Check permissions
echo -e "${CYAN}Checking Permissions:${NC}"
echo -n "  Root access: "
if [ "$EUID" -eq 0 ]; then
    echo -e "${GREEN}✓ Running as root${NC}"
else
    echo -e "${YELLOW}⚠ Not running as root${NC}"
    echo -e "    ${YELLOW}You'll need sudo for hardware control${NC}"
    echo -n "  Sudo available: "
    if command -v sudo &> /dev/null; then
        echo -e "${GREEN}✓ Yes${NC}"
    else
        echo -e "${RED}✗ No${NC}"
    fi
fi
echo

# Recent kernel messages
echo -e "${CYAN}Recent Kernel Messages:${NC}"
DMESG_OUTPUT=$(dmesg | grep msi-ec | tail -n 5 2>/dev/null)
if [ -n "$DMESG_OUTPUT" ]; then
    echo -e "${GREEN}Last 5 msi-ec messages:${NC}"
    echo "$DMESG_OUTPUT" | sed 's/^/  /'
else
    echo -e "  ${YELLOW}No recent msi-ec messages in dmesg${NC}"
fi
echo

# Summary
echo -e "${CYAN}╔════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║              Validation Summary            ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════╝${NC}"

ISSUES=0

if ! lsmod | grep -q msi_ec; then
    echo -e "${RED}✗ Kernel module not loaded${NC}"
    ISSUES=$((ISSUES + 1))
fi

if [ ! -d "/sys/devices/platform/msi-ec" ]; then
    echo -e "${RED}✗ sysfs interface not available${NC}"
    ISSUES=$((ISSUES + 1))
fi

if [ ! -x "./msi-ec-control" ] && ! command -v msi-ec-control &> /dev/null; then
    echo -e "${YELLOW}⚠ Control script not found${NC}"
    ISSUES=$((ISSUES + 1))
fi

if [ $ISSUES -eq 0 ]; then
    echo -e "${GREEN}✓ All checks passed!${NC}"
    echo -e "${GREEN}✓ System is ready to use MSI EC Control${NC}"
    echo
    echo -e "Run: ${CYAN}sudo ./msi-ec-control${NC}"
else
    echo -e "${YELLOW}Found $ISSUES issue(s)${NC}"
    echo
    echo -e "${CYAN}Recommended actions:${NC}"
    if ! lsmod | grep -q msi_ec; then
        echo -e "  1. Load the kernel module: ${CYAN}sudo modprobe msi-ec${NC}"
        echo -e "     Or install it: See ${CYAN}INSTALLATION.md${NC}"
    fi
    if [ ! -x "./msi-ec-control" ] && ! command -v msi-ec-control &> /dev/null; then
        echo -e "  2. Install the script: ${CYAN}./install.sh${NC}"
    fi
fi

echo
echo -e "${CYAN}For more help:${NC}"
echo -e "  • README.md - User guide"
echo -e "  • INSTALLATION.md - Setup instructions"
echo -e "  • GitHub Issues - Report problems"
echo
