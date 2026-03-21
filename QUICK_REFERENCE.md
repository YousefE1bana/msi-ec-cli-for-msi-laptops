# MSI EC Control Center - Quick Reference

## Installation

```bash
# Quick install (current user)
./install.sh

# System-wide install
./install.sh install system

# Uninstall
./install.sh uninstall
```

## Basic Usage

```bash
# Run the control center
sudo msi-ec-control

# Or use the application menu
Search: "MSI EC Control"
```

## Menu Options

| Option | Function | Shortcut |
|--------|----------|----------|
| 1 | View System Status | - |
| 2 | Real-time Monitor | Press 'S' to stop |
| 3 | Thermal Analysis | 30-second test |
| 4 | Gaming Mode | Max performance |
| 5 | Balanced Mode | Optimal balance |
| 6 | Silent Mode | Quiet operation |
| 7 | Fan Control | auto/silent/advanced |
| 8 | Shift Mode | eco/comfort/turbo |
| 9 | Cooler Boost | Toggle on/off |
| 10 | Super Battery | Toggle on/off |
| 11 | Webcam | Toggle on/off |
| 12 | Windows Key | Toggle on/off |
| 13 | Kbd Backlight | 0-3 levels |
| 14 | Save Profile | Save current config |
| 15 | Load Profile | Load saved config |
| 16 | List Profiles | Show all profiles |
| 17 | History | View recent actions |
| 18 | Exit | Close application |

## Quick Presets

### Gaming Mode (Option 4)
- Fan: Advanced
- Shift: Turbo
- Cooler Boost: ON

### Balanced Mode (Option 5)
- Fan: Auto
- Shift: Comfort
- Cooler Boost: OFF

### Silent Mode (Option 6)
- Fan: Silent
- Shift: Eco
- Super Battery: ON

## Background Monitoring

```bash
# Enable background monitoring
sudo systemctl enable msi-ec-monitor@$USER.service
sudo systemctl start msi-ec-monitor@$USER.service

# Check status
systemctl status msi-ec-monitor@$USER.service

# Stop monitoring
sudo systemctl stop msi-ec-monitor@$USER.service

# View logs
tail -f ~/.config/msi-ec-control/monitor.log
```

## Configuration

### Location
`~/.config/msi-ec-control/config.conf`

### Quick Settings
```bash
# Temperature thresholds
TEMP_CRITICAL=85
TEMP_HIGH=75
TEMP_NORMAL=60

# Notifications
ENABLE_NOTIFICATIONS=true

# Auto-load profile
AUTO_LOAD_PROFILE=true
DEFAULT_PROFILE="balanced"
```

## File Locations

| Item | Path |
|------|------|
| Script | `~/.local/bin/msi-ec-control` |
| Config | `~/.config/msi-ec-control/config.conf` |
| Profiles | `~/.config/msi-ec-control/profiles/` |
| History | `~/.config/msi-ec-control/history.log` |
| Monitor Log | `~/.config/msi-ec-control/monitor.log` |
| Desktop File | `~/.local/share/applications/` |

## Temperature Colors

| Color | Temperature | Status |
|-------|-------------|--------|
| 🟢 Green | < 60°C | Normal |
| 🟡 Yellow | 60-75°C | Warm |
| 🟡 Yellow Bold | 75-85°C | High |
| 🔴 Red Bold | > 85°C | Critical |

## Trend Indicators

- `↑` Rising temperature
- `↓` Falling temperature
- `→` Stable temperature

## Hardware Settings

### Fan Modes
- `auto` - Automatic based on temp
- `silent` - Quiet, lower RPM
- `advanced` - Maximum cooling

### Shift Modes
- `eco` - Power saving
- `comfort` - Balanced
- `turbo` - Maximum performance

### Toggles
- Cooler Boost: `on`/`off`
- Super Battery: `on`/`off`
- Webcam: `on`/`off`
- Windows Key: `left` (enabled) / `right` (disabled)
- Kbd Backlight: `0` (off) to `3` (brightest)

## Profile Management

```bash
# Save current settings
[14] Save Profile
Enter name: "my-gaming-setup"

# Load profile
[15] Load Profile
Enter name: "my-gaming-setup"

# List all profiles
[16] List Profiles
```

## Common Tasks

### Create Gaming Profile
1. Set Fan to Advanced [7]
2. Set Shift to Turbo [8]
3. Enable Cooler Boost [9]
4. Save Profile [14] → "gaming"

### Create Work Profile
1. Set Fan to Silent [7]
2. Set Shift to Eco [8]
3. Enable Super Battery [10]
4. Save Profile [14] → "work"

### Monitor Temperatures
1. Real-time Monitor [2]
2. Press 'S' to stop
3. Or run Thermal Analysis [3] for 30s test

## Troubleshooting

### Module Not Found
```bash
# Check if module is loaded
lsmod | grep msi_ec

# Check sysfs path
ls /sys/devices/platform/msi-ec/
```

### Permission Denied
```bash
# Always use sudo
sudo msi-ec-control
```

### Notifications Not Working
```bash
# Install libnotify
sudo apt install libnotify-bin    # Debian/Ubuntu
sudo pacman -S libnotify           # Arch
sudo dnf install libnotify         # Fedora

# Test notifications
notify-send "Test" "Hello"
```

## Documentation

- `README.md` - Complete documentation
- `INSTALLATION.md` - Installation guide
- `NEW_FEATURES.md` - New features guide
- `IMPROVEMENT_PLAN.md` - Future roadmap
- `CHANGELOG.md` - Version history

## Support

- **Issues**: https://github.com/YousefE1bana/msi-ec-cli-for-msi-laptops/issues
- **Kernel Module**: https://github.com/YousefE1bana/msi-ec-for-msi-laptops

---

**Quick Tip**: Set up your favorite profiles, enable background monitoring, and use the application menu shortcut for quick access! 🚀
