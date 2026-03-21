# New Features & Improvements

This document describes the new features and improvements added to MSI EC Control Center.

## Quick Installation

### One-Command Install

```bash
# Install for current user (recommended)
./install.sh

# Or install system-wide
./install.sh install system

# Uninstall
./install.sh uninstall
```

The installation script will:
- ✅ Check prerequisites and dependencies
- ✅ Install the control center script
- ✅ Set up desktop integration
- ✅ Create configuration directories
- ✅ Install example configuration file
- ✅ Add to application menu

## Configuration File

### Location
`~/.config/msi-ec-control/config.conf`

### Features
Customize the control center without editing the main script:

- **Temperature Thresholds**: Adjust when warnings appear
- **Monitoring Intervals**: Change refresh rates
- **Desktop Notifications**: Enable/disable notifications
- **Color Schemes**: Customize terminal colors
- **Auto-Profile Loading**: Load a profile on startup
- **Logging Options**: Configure history and logging

### Example Configuration

```bash
# Temperature thresholds (Celsius)
TEMP_CRITICAL=85
TEMP_HIGH=75
TEMP_NORMAL=60

# Enable desktop notifications
ENABLE_NOTIFICATIONS=true
NOTIFY_ON_TEMP_WARNING=true

# Auto-load a profile on startup
AUTO_LOAD_PROFILE=false
DEFAULT_PROFILE="balanced"

# Refresh interval for real-time monitoring
MONITOR_REFRESH_INTERVAL=2
```

### Setup

```bash
# Copy example config
cp config.conf.example ~/.config/msi-ec-control/config.conf

# Edit to your preferences
nano ~/.config/msi-ec-control/config.conf
```

## Background Monitoring Service

### What It Does
The background monitor runs continuously and:
- Monitors CPU/GPU temperatures every 30 seconds
- Sends desktop notifications when temperatures exceed thresholds
- Logs temperature warnings
- Prevents notification spam with smart alerting

### Installation

```bash
# Install the monitor script
sudo cp msi-ec-monitor /usr/local/bin/
sudo chmod +x /usr/local/bin/msi-ec-monitor

# Install systemd service
sudo cp systemd/msi-ec-monitor@.service /etc/systemd/system/

# Enable for your user
sudo systemctl enable msi-ec-monitor@$USER.service
sudo systemctl start msi-ec-monitor@$USER.service

# Check status
systemctl status msi-ec-monitor@$USER.service
```

### Usage

```bash
# Start monitoring
sudo systemctl start msi-ec-monitor@$USER.service

# Stop monitoring
sudo systemctl stop msi-ec-monitor@$USER.service

# View logs
journalctl -u msi-ec-monitor@$USER.service -f

# Or view monitor log file
tail -f ~/.config/msi-ec-control/monitor.log
```

### Configuration
Edit `~/.config/msi-ec-control/config.conf`:

```bash
# Enable/disable notifications
ENABLE_NOTIFICATIONS=true

# Temperature thresholds
TEMP_CRITICAL=85
TEMP_HIGH=75

# How often to check (seconds)
CHECK_INTERVAL=30
```

## Desktop Notifications

### Requirements
Install notification support:

```bash
# Debian/Ubuntu/Kali
sudo apt install libnotify-bin

# Arch/Manjaro
sudo pacman -S libnotify

# Fedora
sudo dnf install libnotify
```

### What You'll See

**Critical Temperature (>85°C)**
```
⚠️ MSI Laptop Alert
CPU temperature is critical: 89°C
Consider enabling Cooler Boost!
```

**High Temperature (>75°C)**
```
MSI Laptop
CPU temperature is high: 78°C
```

### Disable Notifications

Edit `~/.config/msi-ec-control/config.conf`:
```bash
ENABLE_NOTIFICATIONS=false
```

## Installation Improvements

### Automatic Path Detection
The desktop file now uses dynamic paths instead of hardcoded ones, so it works for all users automatically.

### User vs System Installation

**User Installation** (recommended for single user):
- Installs to `~/.local/bin/`
- No sudo required for installation
- Desktop file in `~/.local/share/applications/`

**System Installation** (for all users):
- Installs to `/usr/local/bin/`
- Requires sudo
- Desktop file in `/usr/share/applications/`

## Testing the Installation

### Verify Installation

```bash
# Check if script is accessible
which msi-ec-control

# Run the control center
sudo msi-ec-control

# Check if config exists
ls -la ~/.config/msi-ec-control/
```

### Test Notifications

```bash
# Send a test notification
notify-send "Test" "If you see this, notifications work!"

# Start the background monitor
sudo systemctl start msi-ec-monitor@$USER.service

# Wait for temperature check (30 seconds)
# You should see notifications if temps are high
```

## Upgrade From Previous Version

If you have an older installation:

```bash
# Pull latest changes
git pull

# Run the installer
./install.sh

# Your existing profiles and history are preserved
```

## Troubleshooting

### Notifications Not Working

1. Check if libnotify is installed:
   ```bash
   which notify-send
   ```

2. Test notifications manually:
   ```bash
   notify-send "Test" "Hello"
   ```

3. Check DBUS session:
   ```bash
   echo $DBUS_SESSION_BUS_ADDRESS
   ```

4. For systemd service, check logs:
   ```bash
   journalctl -u msi-ec-monitor@$USER.service
   ```

### Desktop File Not Appearing

1. Update desktop database:
   ```bash
   update-desktop-database ~/.local/share/applications/
   ```

2. Check desktop file location:
   ```bash
   ls -la ~/.local/share/applications/msi-control-center.desktop
   ```

3. Verify desktop file syntax:
   ```bash
   desktop-file-validate ~/.local/share/applications/msi-control-center.desktop
   ```

### Service Won't Start

1. Check service status:
   ```bash
   systemctl status msi-ec-monitor@$USER.service
   ```

2. View detailed logs:
   ```bash
   journalctl -xe -u msi-ec-monitor@$USER.service
   ```

3. Ensure MSI EC module is loaded:
   ```bash
   ls /sys/devices/platform/msi-ec/
   ```

## Configuration Examples

### Gaming Setup with Auto-Monitoring

```bash
# config.conf
TEMP_CRITICAL=90          # Higher threshold for gaming
TEMP_HIGH=80
ENABLE_NOTIFICATIONS=true
NOTIFY_ON_TEMP_WARNING=true
AUTO_LOAD_PROFILE=true
DEFAULT_PROFILE="gaming"
```

### Silent Office Setup

```bash
# config.conf
TEMP_CRITICAL=85
TEMP_HIGH=75
ENABLE_NOTIFICATIONS=false  # Quiet mode
AUTO_LOAD_PROFILE=true
DEFAULT_PROFILE="silent"
```

### Developer Setup with Verbose Logging

```bash
# config.conf
VERBOSE_LOGGING=true
ENABLE_TEMP_LOGGING=true
ENABLE_NOTIFICATIONS=true
MONITOR_REFRESH_INTERVAL=5  # More frequent updates
```

## What's Next

See [IMPROVEMENT_PLAN.md](IMPROVEMENT_PLAN.md) for upcoming features:
- Web dashboard for remote monitoring
- Auto-profile switching based on running apps
- Temperature logging and statistics
- GUI application
- Package files (.deb, .rpm, AUR)

## Feedback & Contributions

Found a bug or have a feature request?
- Open an issue: https://github.com/YousefE1bana/msi-ec-cli-for-msi-laptops/issues
- Submit a pull request
- Join the discussion

---

**Enjoy enhanced MSI laptop control!** 🚀
