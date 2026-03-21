# Phase 2 Features - Command-Line Interface & Enhancements

This document describes the Phase 2 improvements added to MSI EC Control Center v2.2.

## Overview

Phase 2 adds powerful command-line interface capabilities, quick desktop shortcuts, and temperature data logging, making the tool more scriptable and user-friendly.

## Feature 1: Command-Line Arguments

### Description
Full CLI argument support allows you to control your MSI laptop from the command line, scripts, or keyboard shortcuts without opening the interactive menu.

### Usage

#### Help and Information
```bash
# Show help message
sudo msi-ec-control --help

# Show version
sudo msi-ec-control --version

# Display current status
sudo msi-ec-control --status
```

#### Monitoring
```bash
# Start real-time monitoring
sudo msi-ec-control --monitor

# Run 30-second thermal analysis
sudo msi-ec-control --analysis
```

#### Direct Settings
```bash
# Set fan mode
sudo msi-ec-control --set-fan auto
sudo msi-ec-control --set-fan silent
sudo msi-ec-control --set-fan advanced

# Set shift mode
sudo msi-ec-control --set-shift eco
sudo msi-ec-control --set-shift comfort
sudo msi-ec-control --set-shift turbo

# Set cooler boost
sudo msi-ec-control --set-cooler-boost on
sudo msi-ec-control --set-cooler-boost off

# Set super battery
sudo msi-ec-control --set-super-battery on

# Set webcam
sudo msi-ec-control --set-webcam off

# Set Windows key
sudo msi-ec-control --set-win-key left   # enabled
sudo msi-ec-control --set-win-key right  # disabled

# Set keyboard backlight
sudo msi-ec-control --set-backlight 3    # 0-3
```

#### Quick Presets
```bash
# Apply gaming preset
sudo msi-ec-control --preset gaming

# Apply balanced preset
sudo msi-ec-control --preset balanced

# Apply silent preset
sudo msi-ec-control --preset silent
```

#### Profile Management
```bash
# Save current settings as profile
sudo msi-ec-control --save-profile my-config

# Load saved profile
sudo msi-ec-control --load-profile my-config

# List all profiles
sudo msi-ec-control --list-profiles

# View history
sudo msi-ec-control --history
```

### Scripting Examples

#### Create Gaming Script
```bash
#!/bin/bash
# gaming-mode.sh - Activate gaming settings

sudo msi-ec-control --preset gaming
notify-send "Gaming Mode" "Performance settings activated!"
```

#### Battery Saver Script
```bash
#!/bin/bash
# battery-saver.sh - Maximize battery life

sudo msi-ec-control --set-fan silent \
                    --set-shift eco \
                    --set-super-battery on \
                    --set-webcam off

notify-send "Battery Saver" "Power saving settings activated!"
```

#### Temperature Check Script
```bash
#!/bin/bash
# check-temp.sh - Quick temperature check

sudo msi-ec-control --status | grep -E "CPU|GPU"
```

### Keyboard Shortcut Integration

You can bind CLI commands to keyboard shortcuts in your desktop environment:

**GNOME/Ubuntu:**
Settings → Keyboard → Custom Shortcuts

**KDE:**
System Settings → Shortcuts → Custom Shortcuts

**Example Shortcuts:**
- `Super + G` → `sudo msi-ec-control --preset gaming`
- `Super + B` → `sudo msi-ec-control --preset balanced`
- `Super + S` → `sudo msi-ec-control --preset silent`

## Feature 2: Quick Preset Desktop Shortcuts

### Description
Three new desktop shortcuts provide one-click access to performance presets with visual notification feedback.

### Desktop Shortcuts Installed

1. **MSI Gaming Mode** 🎮
   - Icon: Gaming controller
   - Action: Activates gaming preset
   - Notification: "Gaming preset activated!"

2. **MSI Balanced Mode** ⚖️
   - Icon: System settings
   - Action: Activates balanced preset
   - Notification: "Balanced preset activated!"

3. **MSI Silent Mode** 🔋
   - Icon: Battery
   - Action: Activates silent preset
   - Notification: "Silent preset activated!"

### Installation
These shortcuts are automatically installed when you run `./install.sh`. They appear in your application menu under "System" → "Settings".

### Manual Installation
```bash
# Install to user applications
cp config/msi-*-mode.desktop ~/.local/share/applications/

# Update desktop database
update-desktop-database ~/.local/share/applications/
```

### Usage
- **From Application Menu**: Search for "MSI Gaming Mode", etc.
- **From Desktop**: Pin to favorites or add to panel
- **Quick Access**: Add to dock or create keyboard shortcut

### Customization
Edit the desktop files in `config/` directory to:
- Change icons
- Modify notifications
- Add additional presets

## Feature 3: Temperature Logging

### Description
Optional CSV logging of temperature and performance data for analysis and monitoring.

### Enable Logging

Edit `~/.config/msi-ec-control/config.conf`:
```bash
# Enable temperature logging
ENABLE_TEMP_LOGGING=true
```

Restart the monitor service:
```bash
sudo systemctl restart msi-ec-monitor@$USER.service
```

### Log File Location
`~/.config/msi-ec-control/temperature.csv`

### Data Format
```csv
timestamp,cpu_temp,gpu_temp,cpu_fan,gpu_fan,fan_mode,shift_mode
2026-03-21 10:30:00,65,55,3000,2500,auto,comfort
2026-03-21 10:30:30,67,56,3200,2600,auto,comfort
2026-03-21 10:31:00,70,58,3500,2800,auto,comfort
```

### Fields Logged
- **timestamp**: Date and time of measurement
- **cpu_temp**: CPU temperature in Celsius
- **gpu_temp**: GPU temperature in Celsius
- **cpu_fan**: CPU fan speed in RPM
- **gpu_fan**: GPU fan speed in RPM
- **fan_mode**: Current fan mode (auto/silent/advanced)
- **shift_mode**: Current shift mode (eco/comfort/turbo)

### Analysis Examples

#### Using Spreadsheet
1. Open `temperature.csv` in LibreOffice Calc, Excel, or Google Sheets
2. Create charts to visualize temperature trends
3. Identify thermal patterns

#### Using Python/Pandas
```python
import pandas as pd
import matplotlib.pyplot as plt

# Load temperature data
df = pd.read_csv('~/.config/msi-ec-control/temperature.csv')
df['timestamp'] = pd.to_datetime(df['timestamp'])

# Plot temperature over time
plt.figure(figsize=(12, 6))
plt.plot(df['timestamp'], df['cpu_temp'], label='CPU')
plt.plot(df['timestamp'], df['gpu_temp'], label='GPU')
plt.xlabel('Time')
plt.ylabel('Temperature (°C)')
plt.title('Temperature Monitoring')
plt.legend()
plt.show()

# Calculate statistics
print(f"CPU - Avg: {df['cpu_temp'].mean():.1f}°C, Max: {df['cpu_temp'].max()}°C")
print(f"GPU - Avg: {df['gpu_temp'].mean():.1f}°C, Max: {df['gpu_temp'].max()}°C")
```

#### Using Command Line
```bash
# View last 10 entries
tail -n 10 ~/.config/msi-ec-control/temperature.csv

# Calculate average CPU temperature
awk -F',' 'NR>1 {sum+=$2; count++} END {print "Avg CPU:", sum/count"°C"}' \
  ~/.config/msi-ec-control/temperature.csv

# Find maximum temperature
awk -F',' 'NR>1 {if($2>max) max=$2} END {print "Max CPU:", max"°C"}' \
  ~/.config/msi-ec-control/temperature.csv

# Count entries per fan mode
awk -F',' 'NR>1 {count[$6]++} END {for(i in count) print i":", count[i]}' \
  ~/.config/msi-ec-control/temperature.csv
```

### Log Management

#### View Current Log
```bash
cat ~/.config/msi-ec-control/temperature.csv
```

#### Check Log Size
```bash
ls -lh ~/.config/msi-ec-control/temperature.csv
```

#### Archive Old Logs
```bash
# Create monthly archive
mv ~/.config/msi-ec-control/temperature.csv \
   ~/.config/msi-ec-control/temperature-$(date +%Y-%m).csv
```

#### Clear Log
```bash
# Keep header, remove data
head -n 1 ~/.config/msi-ec-control/temperature.csv > temp.csv
mv temp.csv ~/.config/msi-ec-control/temperature.csv
```

### Use Cases

1. **Thermal Performance Analysis**
   - Identify hottest times of day
   - Compare different fan modes
   - Evaluate preset effectiveness

2. **Gaming Session Monitoring**
   - Track temperature during gameplay
   - Optimize settings for specific games
   - Ensure safe operating temperatures

3. **Troubleshooting**
   - Identify thermal throttling
   - Document temperature spikes
   - Share data with support

4. **Long-term Trends**
   - Monitor thermal paste degradation
   - Track fan performance over time
   - Seasonal temperature variations

## Integration Tips

### Automate with Cron
```bash
# Run thermal analysis daily at 2 AM
0 2 * * * sudo /usr/local/bin/msi-ec-control --analysis >> /var/log/msi-analysis.log
```

### System Tray Scripts
Create scripts that show current temps in system tray using tools like `argos` or `xbar`.

### Dashboard Integration
Parse the CSV log to display real-time temps in Conky, Polybar, or other status bars.

## Backward Compatibility

All Phase 2 features are:
- ✅ Optional and non-breaking
- ✅ Compatible with existing profiles
- ✅ Work alongside interactive menu
- ✅ Respect existing configuration

## Next Steps

See [IMPROVEMENT_PLAN.md](IMPROVEMENT_PLAN.md) for Phase 3 features:
- Auto-profile switching based on running apps
- Web dashboard for remote monitoring
- GUI application

## Troubleshooting

### CLI Arguments Not Working
- Ensure script is executable: `chmod +x msi-ec-control`
- Check you're using correct path: `which msi-ec-control`
- Always use sudo for write operations

### Desktop Shortcuts Not Appearing
```bash
# Update desktop database
update-desktop-database ~/.local/share/applications/

# Check files exist
ls -la ~/.local/share/applications/msi-*-mode.desktop
```

### Temperature Logging Not Working
```bash
# Check config file
grep ENABLE_TEMP_LOGGING ~/.config/msi-ec-control/config.conf

# Restart monitor service
sudo systemctl restart msi-ec-monitor@$USER.service

# Check logs
journalctl -u msi-ec-monitor@$USER.service -n 50
```

## Feedback

Found a bug or have suggestions? Open an issue on GitHub!

---

**Phase 2 Complete!** ✅ Enjoy enhanced scripting, quick presets, and data logging!
