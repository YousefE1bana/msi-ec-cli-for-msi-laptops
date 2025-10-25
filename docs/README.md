# MSI EC Control# MSI EC Control - Complete Laptop Control Suite# MSI EC Control (open-source)



Professional control center for MSI laptops using the `msi-ec` kernel module.



## 📁 Project StructureControl your MSI laptop's fan, performance modes, and monitor temperatures using the `msi-ec` kernel module.This small project provides two frontends for controlling MSI laptops via the `msi-ec` kernel module:



```

msi-ec-control/

├── bin/                          # Executable scripts## 🚀 Quick Start- `msi-ec-cli`: A command-line tool to read and set fan/performance-related properties.

│   ├── msi-ec-menu              # Simple interactive menu (NEW!)

│   ├── msi-ec-cli-advanced.sh   # Advanced CLI with monitoring- `gui.py`: A simple PyQt6 GUI (MSI Control Center - Open Source Edition) for live monitoring and control.

│   ├── msi-ec-cli.sh            # Original simple CLI

│   └── verify-setup.sh          # Setup verification script### Desktop Shortcuts (Easiest)

├── src/                          # Python source code

│   ├── gui.py                   # PyQt6 GUI applicationDouble-click either icon on your Desktop:Shared logic is in `msi_ec_utils.py`.

│   ├── msi_ec_utils.py          # Core utilities library

│   └── demo_mock_sysfs.py       # Mock sysfs for testing- **MSI Control Center** - Graphical interface with live monitoring

├── config/                       # Configuration files

│   ├── msi-control-center.desktop      # GUI launcher- **MSI EC Control CLI** - Advanced terminal with 16 optionsQuick start

│   └── msi-ec-advanced-cli.desktop     # Menu launcher

├── docs/                         # Documentation-----------

│   ├── README.md                # This file

│   └── LICENSE                  # MIT License### Command Line

├── venv/                         # Python virtual environment

├── requirements.txt              # Python dependencies```bash**Note for Kali Linux users:** This project uses a virtual environment (venv) to avoid conflicts with system Python packages.

└── .gitignore                   # Git ignore rules

```# GUI (graphical interface)



## 🚀 Quick Start./run-gui-sudo.sh1. Ensure the `msi-ec` kernel module is loaded and that `/sys/devices/platform/msi-ec` exists.



### 1. Install Desktop Shortcuts (Recommended)



```bash# Advanced CLI (terminal menu)2. The virtual environment is already set up with dependencies installed. Use the launcher scripts:

# Copy desktop files to applications menu

cp config/*.desktop ~/.local/share/applications/sudo ./msi-ec-cli-advanced.sh



# Copy to desktop for quick access3. CLI usage examples:

cp config/*.desktop ~/Desktop/

chmod +x ~/Desktop/*.desktop# Simple CLI (Python)

```

./run-cli.sh --status```bash

### 2. Command Line Usage

sudo ./run-cli.sh --set-fan-mode silent# show current state

**Simple Menu (NEW!):**

```bash```./run-cli.sh --status

sudo bin/msi-ec-menu

```



**GUI Application:**## 📦 What's Included# set fan mode (requires root/sudo for writes)

```bash

./msi-ec-guisudo ./run-cli.sh --set-fan-mode auto

```

### 1. GUI Application (`gui.py`)

**Advanced CLI:**

```bash**Features:**# enable cooler boost

sudo bin/msi-ec-cli-advanced.sh

```- Real-time temperature monitoring (updates every 2s)sudo ./run-cli.sh --cooler-boost enable



## 📋 Features Comparison- Color-coded temps: 🟢 <60°C | 🟡 60-80°C | 🔴 >80°C



| Feature | Simple Menu | GUI | Advanced CLI |- Fan mode: auto, silent, advanced# toggle webcam

|---------|-------------|-----|--------------|

| View Status | ✅ | ✅ | ✅ |- Shift mode: eco, comfort, turbosudo ./run-cli.sh --toggle webcam

| Set Fan Mode | ✅ | ✅ | ✅ |

| Set Shift Mode | ✅ | ✅ | ✅ |- Quick presets: Turbo Mode, Quiet Mode```

| Toggle Cooler Boost | ✅ | ✅ | ✅ |

| Real-time Monitoring | ❌ | ✅ (Auto) | ✅ (Manual) |- Toggle: Cooler Boost, Webcam, Keyboard Backlight, Super Battery, Windows Key

| Performance Presets | ❌ | ✅ | ✅ |

| Save/Load Profiles | ❌ | ❌ | ✅ |4. GUI:

| Thermal Analysis | ❌ | ❌ | ✅ |

| Battery Controls | ❌ | ✅ | ✅ |**Run:** `./run-gui-sudo.sh` or use Desktop shortcut

| Webcam Toggle | ❌ | ✅ | ✅ |

| Keyboard Backlight | ❌ | ✅ | ✅ |```bash



## 🎯 Simple Menu Usage### 2. Advanced CLI (`msi-ec-cli-advanced.sh`)./run-gui.sh



The new **msi-ec-menu** provides a clean, simple interface:**Features:**```



```- 🌡️ Temperature bars with trend indicators (↑↓→)

==============================

 MSI EC Control Menu- 🔄 Real-time monitoring mode**Alternative:** Activate venv manually and run directly:

==============================

[1] View System Status- 📈 30-second thermal analysis with recommendations

[2] Set Fan Mode

[3] Set Shift Mode- 🎮 Quick presets: Gaming, Balanced, Silent```bash

[4] Toggle Cooler Boost

[5] Launch GUI- 💾 Profile save/load systemsource venv/bin/activate

[6] Exit

==============================- 📜 History tracking (last 100 actions)./msi-ec-cli --status

Choice:

```- 💨 CPU & GPU fan speed displaypython3 gui.py



**Run it:**- ⚙️ Firmware info display```

```bash

sudo bin/msi-ec-menu

```

**Run:** `sudo ./msi-ec-cli-advanced.sh` or use Desktop shortcutThe GUI shows CPU/GPU temperatures with colored indicators:

## 🖥️ GUI Application

- **Green** background: temperatures < 60°C (normal)

The GUI provides:

- **Real-time monitoring** with 2-second refresh### 3. Python CLI (`msi-ec-cli`)- **Yellow** background: temperatures 60-80°C (warm)

- **Color-coded temperatures** (green < 60°C, yellow 60-80°C, red > 80°C)

- **Quick presets**: Turbo Mode, Quiet Mode**Features:**- **Red** background: temperatures > 80°C (hot)

- **Easy toggles** for all features

- Simple command-line interface

**Launch:**

- Desktop shortcut: **MSI Control Center**- Status table with tabulateTesting without hardware

- Command line: `./msi-ec-gui`

- Direct setting changes------------------------

## ⚙️ Available Settings

- Scriptable/automation friendly

### Fan Modes

- **auto** - Automatic fan controlIf you don't have the msi-ec module loaded or want to test the tools safely, use the demo mock:

- **silent** - Quiet operation (lower RPM)

- **advanced** - Maximum cooling**Examples:**



### Shift Modes```bash```bash

- **eco** - Power saving mode

- **comfort** - Balanced performance./run-cli.sh --status# Create a mock sysfs structure in /tmp

- **turbo** - Maximum performance

sudo ./run-cli.sh --set-fan-mode auto./demo_mock_sysfs.py

### Toggles

- **cooler_boost** - Enhanced cooling (0/1)sudo ./run-cli.sh --set-shift-mode turbo

- **webcam** - Enable/disable webcam (0/1)

- **kbd_backlight** - Keyboard backlight brightness (0-3)sudo ./run-cli.sh --cooler-boost enable# Edit msi_ec_utils.py and change BASE to:

- **super_battery** - Battery saving mode (0/1)

- **win_key** - Windows key enable/disable (0/1)sudo ./run-cli.sh --toggle webcam#   BASE = Path("/tmp/msi-ec-demo")



## 🔧 Installation```



### Prerequisites# Now run the CLI or GUI against the mock data



```bash### 4. Original Bash Script (`msi-ec-cli.sh`)./msi-ec-cli --status

# Ensure msi-ec kernel module is loaded

ls /sys/devices/platform/msi-ecSimple interactive bash menu (your original script, still available).python3 gui.py

```

```

### Setup Virtual Environment (for GUI)

## 📁 Project Structure

```bash

# Create venvNotes and assumptions

python3 -m venv venv

```---------------------

# Activate venv

source venv/bin/activatemsi-ec-control/- This code assumes certain sysfs filenames (fan_mode, shift_mode, cpu_temp, gpu_temp, cooler_boost, etc.).



# Install dependencies├── gui.py                       # PyQt6 GUI application- If your platform uses different names, edit `KNOWN_FILES` in `msi_ec_utils.py`.

pip install -r requirements.txt

```├── msi-ec-cli                   # Python CLI tool- Writing to sysfs requires appropriate permissions (root or udev rules). Use `sudo` for writes where necessary.



### Verify Installation├── msi-ec-cli-advanced.sh       # Advanced bash menu (680 lines, 16 options)



```bash├── msi-ec-cli.sh                # Original bash menu (simple)Security

./bin/verify-setup.sh

```├── msi_ec_utils.py              # Shared Python utilities--------



## 🛡️ Permissions├── run-gui-sudo.sh              # GUI launcher (with root)- This tool writes directly to kernel-provided sysfs files. Be careful and only use on supported hardware.



Most operations require **root privileges** to write to sysfs files.├── run-cli.sh                   # Python CLI launcher (uses venv)



**Options:**├── demo_mock_sysfs.py           # Testing helper (creates mock data)Contributing / Next steps

1. Run with `sudo` (recommended for CLI)

2. Use `pkexec` for graphical sudo (GUI uses this)├── verify-setup.sh              # Verify venv is working-------------------------

3. Add udev rules for your user (advanced)

├── requirements.txt             # Python dependencies- Add unit tests that mock sysfs.

## 📊 Monitoring

├── venv/                        # Virtual environment (isolated packages)- Add packaging (pip entry points) and a systemd service for background monitoring.

### Real-time monitoring in terminal:

```bash├── .vscode/settings.json        # VS Code Python config- Improve GUI styling and add icons/dark mode.

sudo bin/msi-ec-cli-advanced.sh

# Select option [3] for real-time monitoring└── *.desktop                    # Desktop shortcuts- Add a tray icon for background monitoring and quick presets.

```

```- Create .deb/.rpm packages for easier installation.

### Thermal Analysis (30-second test):

```bash- Add udev rules or PolKit policy for non-root write access.

sudo bin/msi-ec-cli-advanced.sh

# Select option [4] for thermal analysis## ⚙️ Installation

```

Project structure

## 🔍 Troubleshooting

### Virtual Environment (Already Set Up)-----------------

### GUI doesn't start

```bashThe project uses a Python venv to avoid conflicts with system packages:

# Check if venv is properly set up

ls venv/lib/python*/site-packages/PyQt6```bash```



# Reinstall dependenciessource venv/bin/activate  # If neededmsi-ec-control/

source venv/bin/activate

pip install --upgrade -r requirements.txtpip list | grep -E "(PyQt6|tabulate)"  # Verify packages├── msi_ec_utils.py              # Shared utilities (read/write sysfs)

```

```├── msi-ec-cli                   # CLI tool (executable Python script)

### Permission denied errors

```bash├── gui.py                       # PyQt6 GUI app

# Make sure you're running with sudo

sudo ./msi-ec-gui### Desktop Integration├── demo_mock_sysfs.py           # Helper to create a mock sysfs for testing



# Or for simple menuDesktop shortcuts are already installed at:├── msi-control-center.desktop   # Desktop entry for GUI launcher (optional)

sudo bin/msi-ec-menu

```- `~/Desktop/msi-control-center.desktop` (GUI)├── requirements.txt             # Python dependencies



### Module not found- `~/Desktop/msi-ec-advanced-cli.desktop` (CLI)├── LICENSE                      # MIT License

```bash

# Check if msi-ec module is loaded├── .gitignore                   # Git ignore patterns

lsmod | grep msi_ec

### Manual Install└── README.md                    # This file

# Module should be at

ls -la /sys/devices/platform/msi-ec/If shortcuts are missing:```

```

```bash

## 📝 Development

cp msi-control-center.desktop ~/Desktop/All tools depend on `msi_ec_utils.py` for low-level operations.

### Project Layout

cp msi-ec-advanced-cli.desktop ~/Desktop/

- **src/** - Python source code (GUI and utilities)

- **bin/** - Executable bash/python scriptschmod +x ~/Desktop/*.desktop### Desktop integration

- **config/** - Desktop integration files

- **docs/** - Documentation and license```



### Adding New FeaturesTo add the GUI to your application menu, copy the `.desktop` file:



1. Edit `src/msi_ec_utils.py` to add new sysfs file mappings## 🎯 Usage Examples

2. Update GUI in `src/gui.py`

3. Update simple menu in `bin/msi-ec-menu````bash

4. Test changes with `sudo`

### Gaming Sessioncp msi-control-center.desktop ~/.local/share/applications/

### Testing Without Hardware

**GUI:** Click "Turbo Mode" buttonupdate-desktop-database ~/.local/share/applications/

```bash

# Create mock sysfs structure**CLI:** Press `4` (Gaming Mode)```

python3 src/demo_mock_sysfs.py

**Python:** `sudo ./run-cli.sh --set-fan-mode advanced --set-shift-mode turbo`

# Edit msi_ec_utils.py to use mock path

# Change: BASE = Path("/tmp/msi-ec-demo")

```### Silent Mode (Battery Saving)

**GUI:** Click "Quiet Mode" button

## 📜 License**CLI:** Press `6` (Silent Mode)



MIT License - see `docs/LICENSE` for details.### Monitor Temperatures

**GUI:** Leave window open (auto-refreshes)

## 🙏 Credits**CLI:** Press `2` (Real-time monitor with trends)



Based on the `msi-ec` kernel module for MSI laptop control.### Thermal Analysis

**CLI only:** Press `3` (30s analysis with recommendations)

---

### Save Your Settings

**Enjoy controlling your MSI laptop! 🚀****CLI:** Press `12` → Enter profile name → Settings saved

**Load:** Press `13` → Enter profile name

For issues or suggestions, check the kernel module documentation or create an issue in your repository.

## 🔧 Available Settings

### Hardware Paths (Real MSI EC Module)
```
/sys/devices/platform/msi-ec/
├── cpu/realtime_temperature      # CPU temp
├── gpu/realtime_temperature      # GPU temp
├── cpu/realtime_fan_speed        # CPU fan RPM
├── gpu/realtime_fan_speed        # GPU fan RPM
├── fan_mode                      # auto|silent|advanced
├── shift_mode                    # eco|comfort|turbo
├── cooler_boost                  # on|off
├── super_battery                 # on|off
├── webcam                        # on|off
├── win_key                       # left|right|disabled
└── leds/msiacpi::kbd_backlight/brightness  # 0-3
```

### Mode Combinations

| Use Case | Fan Mode | Shift Mode | Cooler Boost | Super Battery |
|----------|----------|------------|--------------|---------------|
| Gaming   | advanced | turbo      | on           | off           |
| Balanced | auto     | comfort    | off          | off           |
| Silent   | silent   | eco        | off          | on            |

## 🐛 Troubleshooting

### GUI doesn't change settings
→ You need root permissions. Use `./run-gui-sudo.sh` instead of `./run-gui.sh`

### Python import errors
→ Activate venv: `source venv/bin/activate`

### "Module not found" error
→ Check if msi-ec is loaded: `ls /sys/devices/platform/msi-ec`

### Desktop icon doesn't work
→ Right-click and select "Allow Launching" or "Trust and Launch"

### Verify everything works
```bash
./verify-setup.sh  # Check venv and packages
./run-cli.sh --status  # Test Python CLI
```

## 🧪 Testing Without Hardware

Create mock sysfs structure for testing:
```bash
source venv/bin/activate
python3 demo_mock_sysfs.py

# Edit msi_ec_utils.py line 23:
# Change: BASE = Path("/sys/devices/platform/msi-ec")
# To:     BASE = Path("/tmp/msi-ec-demo")

# Now test safely
./run-cli.sh --status
./run-gui.sh
```

## 📊 Feature Comparison

| Feature | Python CLI | Bash CLI | Advanced Bash | GUI |
|---------|------------|----------|---------------|-----|
| Status display | ✅ Table | ✅ Basic | ✅ Rich + bars | ✅ Visual |
| Set fan/shift mode | ✅ | ✅ | ✅ | ✅ |
| Toggle features | ✅ | ✅ | ✅ | ✅ |
| Real-time monitor | ❌ | ❌ | ✅ Auto-refresh | ✅ Auto-refresh |
| Temperature bars | ❌ | ❌ | ✅ Progress bars | ✅ Colors |
| Trend indicators | ❌ | ❌ | ✅ ↑↓→ arrows | ❌ |
| Thermal analysis | ❌ | ❌ | ✅ 30s stats | ❌ |
| Quick presets | ❌ | ❌ | ✅ 3 presets | ✅ 2 presets |
| Profile system | ❌ | ❌ | ✅ Save/load | ❌ |
| History tracking | ❌ | ❌ | ✅ Last 100 | ❌ |
| Fan speed display | ❌ | ❌ | ✅ CPU+GPU | ✅ Total |
| Scriptable | ✅ | ❌ | ❌ | ❌ |

## 🔒 Permissions

All write operations require root. Options:

1. **Use provided launchers** (simplest)
   - `./run-gui-sudo.sh` (GUI with pkexec)
   - `sudo ./msi-ec-cli-advanced.sh` (CLI)
   - `sudo ./run-cli.sh` (Python)

2. **Manual sudo**
   ```bash
   sudo python3 gui.py
   sudo ./msi-ec-cli-advanced.sh
   ```

3. **Udev rules** (advanced, allows non-root access)
   Create `/etc/udev/rules.d/99-msi-ec.rules`:
   ```
   SUBSYSTEM=="platform", KERNEL=="msi-ec", MODE="0666"
   ```

## 📈 History & Logs

Advanced CLI logs all actions to:
```
~/.config/msi-ec-control/history.log
```

View recent changes:
```bash
tail -n 20 ~/.config/msi-ec-control/history.log
```

Profiles saved to:
```
~/.config/msi-ec-control/profiles/*.profile
```

## 🎓 Advanced Features (CLI Only)

### Profile System
```bash
# Save current settings
sudo ./msi-ec-cli-advanced.sh
Press: 12 → Enter name: "my-gaming-profile"

# Load anytime
Press: 13 → Enter name: "my-gaming-profile"
```

### Thermal Analysis
```bash
sudo ./msi-ec-cli-advanced.sh
Press: 3

# Output:
# Running 30-second thermal analysis...
# Sample 1/15: CPU 65°C | GPU 52°C
# ...
# Results: CPU Avg 66°C Max 72°C
# Recommendations: Consider enabling Cooler Boost
```

### Real-Time Monitoring
```bash
sudo ./msi-ec-cli-advanced.sh
Press: 2

# Updates every 2 seconds
# Shows temperature trends (↑ rising, ↓ falling, → stable)
# Auto-warns on critical temps (>85°C)
# Ctrl+C to exit
```

## 📝 Development

### Structure
- **msi_ec_utils.py** - Core sysfs read/write functions
- **gui.py** - PyQt6 GUI using msi_ec_utils
- **msi-ec-cli** - Python argparse CLI using msi_ec_utils
- **msi-ec-cli-advanced.sh** - Standalone bash with all features

### Adding New Features
Edit `KNOWN_FILES` in `msi_ec_utils.py` if hardware paths differ:
```python
KNOWN_FILES = {
    "fan_mode": "fan_mode",
    "cpu_temp": "cpu/realtime_temperature",
    # Add your custom paths here
}
```

## 📜 License

MIT License - See LICENSE file

## 🙏 Credits

- Original script: Yousef Osama
- Enhanced version: AI-assisted development
- MSI EC kernel module: Linux community

---

## 🎉 Quick Reference

### Desktop Usage
1. **Gaming:** Double-click CLI icon → Press `4`
2. **Silent:** Double-click CLI icon → Press `6`
3. **Monitor:** Double-click GUI icon (leave open)
4. **Analysis:** Double-click CLI icon → Press `3`

### Command Line
```bash
# Status
./run-cli.sh --status

# Gaming mode (quick)
sudo ./run-cli.sh --set-fan-mode advanced --set-shift-mode turbo

# Silent mode (quick)
sudo ./run-cli.sh --set-fan-mode silent --set-shift-mode eco

# Advanced menu
sudo ./msi-ec-cli-advanced.sh
```

**Current System (from last check):**
- CPU: 72°C (warm)
- Fan: 48 RPM (silent)
- Mode: silent + turbo

Enjoy full control of your MSI laptop! 🚀
