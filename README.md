# MSI EC Control Center

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/bash-5.0%2B-green.svg)](https://www.gnu.org/software/bash/)
[![MSI EC](https://img.shields.io/badge/MSI--EC-kernel%20module-blue.svg)](https://github.com/BeardOverflow/msi-ec)

A complete, feature-rich control center for MSI laptops using the `msi-ec` kernel module. Single-file bash script with no dependencies - control your MSI laptop's performance, fans, and settings with an intuitive terminal interface.

```
 __  __ ____ ___   _____ ____    ____            _             _ 
|  \/  / ___|_ _| | ____/ ___|  / ___|___  _ __ | |_ _ __ ___ | |
| |\/| \___ \| |  |  _|| |     | |   / _ \| '_ \| __| '__/ _ \| |
| |  | |___) | |  | |__| |___  | |__| (_) | | | | |_| | | (_) | |
|_|  |_|____/___| |_____\____|  \____\___/|_| |_|\__|_|  \___/|_|
```

## ✨ Features

- 🌡️ **Real-time Monitoring** - Live temperature and fan speed tracking with color indicators
- 🎮 **Quick Presets** - Gaming, Balanced, and Silent modes with one click
- ⚙️ **Manual Controls** - Fine-tune fan mode, shift mode, and all hardware settings
- 💾 **Profile System** - Save and load your custom configurations
- 📊 **Thermal Analysis** - 30-second monitoring with smart recommendations
- 🎨 **Beautiful Interface** - Clean ASCII art with color-coded information
- 🚀 **Zero Dependencies** - Pure bash script, no Python or external libraries needed

## 🎯 Quick Start

### Prerequisites

1. MSI laptop with the `msi-ec` kernel module installed and loaded
2. Root access (sudo)

> **📖 New to MSI EC?** See our complete [INSTALLATION.md](INSTALLATION.md) guide for step-by-step instructions on installing both the kernel module and control center.

### Quick Install (Module Already Installed)

```bash
# Clone this control center
git clone https://github.com/YousefE1bana/msi-ec-cli-for-msi-laptops.git
cd msi-ec-cli-for-msi-laptops

# Make executable
chmod +x msi-ec-control

# Run
sudo ./msi-ec-control
```

### Full Install (Fresh Setup)

If you haven't installed the MSI EC kernel module yet:

```bash
# Step 1: Install kernel module (our forked version)
git clone https://github.com/YousefE1bana/msi-ec-for-msi-laptops.git
cd msi-ec-for-msi-laptops
make
sudo insmod msi-ec.ko

# Verify it's loaded
ls /sys/devices/platform/msi-ec/

# Step 2: Install control center
cd ~
git clone https://github.com/YousefE1bana/msi-ec-cli-for-msi-laptops.git
cd msi-ec-cli-for-msi-laptops
chmod +x msi-ec-control
sudo ./msi-ec-control
```

> **📖 For detailed instructions, troubleshooting, and making the module load on boot, see [INSTALLATION.md](INSTALLATION.md)**

### Desktop Shortcut (Optional)

```bash

# Install launchercd msi-ec-for-msi-laptops- ✅ Quick presets (Gaming/Balanced/Silent)

cp config/msi-control-center.desktop ~/.local/share/applications/

cp config/msi-control-center.desktop ~/Desktop/

chmod +x ~/Desktop/msi-control-center.desktop

```# Make executable- ✅ Cooler Boost toggle- `gui.py`: A simple PyQt6 GUI (MSI Control Center - Open Source Edition) for live monitoring and control.



## 📋 Menu Optionschmod +x msi-ec-control



### Status & Monitoring- ✅ Super Battery mode

- **[1] View System Status** - Display all current settings and temperatures

- **[2] Real-time Monitor** - Auto-refreshing status (Press 'S' to stop)# Run the control center

- **[3] Thermal Analysis** - 30-second temperature monitoring with recommendations

sudo ./msi-ec-control- ✅ Webcam enable/disable**GUI Application:**

### Quick Presets

- **[4] Gaming Mode** - Maximum performance (Advanced fan + Turbo + Cooler Boost)```

- **[5] Balanced Mode** - Optimal balance (Auto fan + Comfort)

- **[6] Silent Mode** - Quiet operation (Silent fan + Eco + Super Battery)- ✅ Windows Key enable/disable



### Manual Controls### Desktop Shortcut (Optional)

- **[7] Fan Control** - Set fan mode (auto/silent/advanced)

- **[8] Shift Mode** - Set performance mode (eco/comfort/turbo)- ✅ Keyboard backlight control (0-3 brightness levels)```bash### Desktop Shortcuts (Easiest)

- **[9] Cooler Boost** - Toggle enhanced cooling

- **[10] Super Battery** - Toggle battery saving mode```bash

- **[11] Webcam** - Enable/disable webcam

- **[12] Windows Key** - Enable/disable Windows key# Install desktop launcher- ✅ Profile save/load system

- **[13] Keyboard Backlight** - Set brightness (0-3)

cp config/msi-control-center.desktop ~/.local/share/applications/

### Profile Management

- **[14] Save Profile** - Save current configurationcp config/msi-control-center.desktop ~/Desktop/- ✅ 30-second thermal analysis with recommendations./msi-ec-gui

- **[15] Load Profile** - Restore saved configuration

- **[16] List Profiles** - Show all saved profileschmod +x ~/Desktop/msi-control-center.desktop



### Other```- ✅ Real-time monitoring mode (auto-refresh every 2s)

- **[17] History** - View recent actions

- **[18] Exit** - Close application



## 🖥️ Screenshots## 📋 Menu Options- ✅ Action history log```Double-click either icon on your Desktop:Shared logic is in `msi_ec_utils.py`.



### Main Menu

```

 __  __ ____ ___   _____ ____    ____            _             _ ### Status & Monitoring

|  \/  / ___|_ _| | ____/ ___|  / ___|___  _ __ | |_ _ __ ___ | |

| |\/| \___ \| |  |  _|| |     | |   / _ \| '_ \| __| '__/ _ \| |- **[1] View System Status** - Display all current settings and temperatures

| |  | |___) | |  | |__| |___  | |__| (_) | | | | |_| | | (_) | |

|_|  |_|____/___| |_____\____|  \____\___/|_| |_|\__|_|  \___/|_|- **[2] Real-time Monitor** - Auto-refreshing status (Press 'S' to stop)## 📋 Requirements

============================================================

[*] Yousef Osama - Cybersecurity Engineering Student- **[3] Thermal Analysis** - 30-second temperature monitoring with recommendations

============================================================

```



### System Status### Quick Presets

- Color-coded temperatures (Green/Yellow/Red)

- Trend indicators (↑↓→)- **[4] Gaming Mode** - Maximum performance (Advanced fan + Turbo + Cooler Boost)- MSI laptop with `msi-ec` kernel module loaded**Desktop Shortcuts:**- **MSI Control Center** - Graphical interface with live monitoring

- Visual temperature bars

- All hardware settings displayed- **[5] Balanced Mode** - Optimal balance (Auto fan + Comfort)



## 📦 Project Structure- **[6] Silent Mode** - Quiet operation (Silent fan + Eco + Super Battery)- Root privileges (uses `sudo`)



```

msi-ec-control-center/

├── msi-ec-control              # Main executable (all-in-one script)### Manual Controls- Bash shell- Click **MSI Control Center** for GUI

├── INSTALLATION.md             # Complete installation guide

├── config/- **[7] Fan Control** - Set fan mode (auto/silent/advanced)

│   └── msi-control-center.desktop

├── docs/- **[8] Shift Mode** - Set performance mode (eco/comfort/turbo)

│   ├── LICENSE

│   └── README.md- **[9] Cooler Boost** - Toggle enhanced cooling

└── README.md

```- **[10] Super Battery** - Toggle battery saving mode## 🎯 Menu Structure (18 Options)- Click **MSI EC Control Menu** for terminal menu- **MSI EC Control CLI** - Advanced terminal with 16 optionsQuick start



## 🔧 Available Settings- **[11] Webcam** - Enable/disable webcam



### Fan Modes- **[12] Windows Key** - Enable/disable Windows key

- `auto` - Automatic fan control based on temperature

- `silent` - Quiet operation with lower RPM- **[13] Keyboard Backlight** - Set brightness (0-3)

- `advanced` - Maximum cooling performance

### Status & Monitoring

### Shift Modes

- `eco` - Power saving mode (lower performance)### Profile Management

- `comfort` - Balanced performance and efficiency

- `turbo` - Maximum performance mode- **[14] Save Profile** - Save current configuration1. **View System Status** - Display all current settings and temperatures



### Toggles- **[15] Load Profile** - Restore saved configuration

- **Cooler Boost** - Enhanced cooling (on/off)

- **Super Battery** - Battery saving mode (on/off)- **[16] List Profiles** - Show all saved profiles2. **Real-time Monitor** - Auto-refreshing status display (Ctrl+C to exit)## 📁 Project Structure-----------

- **Webcam** - Camera enable/disable (on/off)

- **Windows Key** - Windows key functionality (left=enabled/right=disabled)

- **Keyboard Backlight** - Brightness levels (0=off, 1=low, 2=medium, 3=high)

### Other3. **Run Thermal Analysis** - 30-second temperature monitoring with recommendations

## 💡 Usage Examples

- **[17] History** - View recent actions

### Quick Gaming Setup

```bash- **[18] Exit** - Close application

sudo ./msi-ec-control

# Select [4] Gaming Mode

```

## 🖥️ Screenshots### Quick Presets

### Save Your Configuration

```bash

sudo ./msi-ec-control

# Configure your settings manually### Main Menu4. **Gaming Mode** - Advanced fan + Turbo shift + Cooler Boost ON```### Command Line

# Select [14] Save Profile

# Enter profile name: "my-gaming-profile"```

```

 __  __ ____ ___   _____ ____    ____            _             _ 5. **Balanced Mode** - Auto fan + Comfort shift

### Monitor Temperatures in Real-time

```bash|  \/  / ___|_ _| | ____/ ___|  / ___|___  _ __ | |_ _ __ ___ | |

sudo ./msi-ec-control

# Select [2] Real-time Monitor| |\/| \___ \| |  |  _|| |     | |   / _ \| '_ \| __| '__/ _ \| |6. **Silent Mode** - Silent fan + Eco shift + Super Battery ON├── bin/          # Executable scripts (menu, advanced CLI, etc.)

# Press 'S' to stop monitoring

```| |  | |___) | |  | |__| |___  | |__| (_) | | | | |_| | | (_) | |



## 🛠️ Troubleshooting|_|  |_|____/___| |_____\____|  \____\___/|_| |_|\__|_|  \___/|_|



### "MSI EC module not found" error============================================================



The kernel module isn't loaded. See [INSTALLATION.md](INSTALLATION.md) for setup instructions.[*] Yousef Osama - Cybersecurity Engineering Student### Manual Controls├── src/          # Python source (GUI, utilities)```bash**Note for Kali Linux users:** This project uses a virtual environment (venv) to avoid conflicts with system Python packages.



```bash============================================================

# Check if module is loaded

lsmod | grep msi_ec```7. **Change Fan Mode** - Select from available fan modes



# Check if sysfs path exists

ls /sys/devices/platform/msi-ec

```### System Status8. **Change Shift Mode** - Select from available shift modes├── config/       # Desktop integration files



### Permission Denied- Color-coded temperatures (Green/Yellow/Red)



Always run with sudo:- Trend indicators (↑↓→)9. **Toggle Cooler Boost** - Enhanced cooling on/off

```bash

sudo ./msi-ec-control- Visual temperature bars

```

- All hardware settings displayed10. **Toggle Super Battery** - Battery saving mode on/off├── docs/         # Full documentation and license# GUI (graphical interface)

### Settings Not Applying



- Some features may not be available on all MSI laptop models

- Check kernel module logs: `dmesg | grep msi-ec`## 📦 Project Structure11. **Toggle Webcam** - Enable/disable webcam

- Verify your laptop is supported by the msi-ec module



## 🤝 Contributing

```12. **Toggle Windows Key** - Enable (left) / Disable (right)└── venv/         # Python virtual environment

Contributions are welcome! Please feel free to submit a Pull Request.

msi-ec-control/

1. Fork the repository

2. Create your feature branch (`git checkout -b feature/AmazingFeature`)├── msi-ec-control              # Main executable (all-in-one)13. **Set Keyboard Backlight** - Brightness levels 0-3

3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)

4. Push to the branch (`git push origin feature/AmazingFeature`)├── config/

5. Open a Pull Request

│   └── msi-control-center.desktop```./run-gui-sudo.sh1. Ensure the `msi-ec` kernel module is loaded and that `/sys/devices/platform/msi-ec` exists.

## 📜 License

├── docs/

This project is licensed under the MIT License - see the [LICENSE](docs/LICENSE) file for details.

│   ├── LICENSE### Profile Management

## 🙏 Acknowledgments

│   └── README.md

- **MSI EC Kernel Module** - [BeardOverflow/msi-ec](https://github.com/BeardOverflow/msi-ec)

- **Our Forked Module** - [YousefE1bana/msi-ec-for-msi-laptops](https://github.com/YousefE1bana/msi-ec-for-msi-laptops)└── README.md14. **Save Current as Profile** - Save all current settings

- Thanks to all MSI laptop users who contributed to the kernel module development

```

## 👤 Author

15. **Load Profile** - Restore saved settings

**Yousef Osama (YousefE1bana)**

- Cybersecurity Engineering Student at Egyptian Chinese University## 🔧 Available Settings

- GitHub: [@YousefE1bana](https://github.com/YousefE1bana)

16. **List Profiles** - Show all available profiles## 📖 Full Documentation

## 🌟 Show Your Support

### Fan Modes

Give a ⭐️ if this project helped you control your MSI laptop!

- `auto` - Automatic fan control based on temperature

## 📞 Support

- `silent` - Quiet operation with lower RPM

For issues, questions, or suggestions:

- **Control Center**: [GitHub Issues](https://github.com/YousefE1bana/msi-ec-control-center/issues)- `advanced` - Maximum cooling performance### Other

- **Kernel Module**: [Module Issues](https://github.com/YousefE1bana/msi-ec-for-msi-laptops/issues)

- **Original MSI EC**: [BeardOverflow/msi-ec](https://github.com/BeardOverflow/msi-ec)



## 🔗 Related Projects### Shift Modes17. **View History** - Show last 20 actions



- **MSI EC Kernel Module (Forked)**: [msi-ec-for-msi-laptops](https://github.com/YousefE1bana/msi-ec-for-msi-laptops)- `eco` - Power saving mode (lower performance)

- **Original MSI EC Module**: [BeardOverflow/msi-ec](https://github.com/BeardOverflow/msi-ec)

- `comfort` - Balanced performance and efficiency18. **Exit** - Close the applicationSee **[docs/README.md](docs/README.md)** for complete documentation including:# Advanced CLI (terminal menu)2. The virtual environment is already set up with dependencies installed. Use the launcher scripts:

---

- `turbo` - Maximum performance mode

**Made with ❤️ for MSI laptop users**



### Toggles

- **Cooler Boost** - Enhanced cooling (on/off)## 📊 Status Display Features- Installation instructions

- **Super Battery** - Battery saving mode (on/off)

- **Webcam** - Camera enable/disable (on/off)

- **Windows Key** - Windows key functionality (left=enabled/right=disabled)

- **Keyboard Backlight** - Brightness levels (0=off, 1=low, 2=medium, 3=high)The status screen shows:- Feature comparisonsudo ./msi-ec-cli-advanced.sh



## 💡 Usage Examples- **CPU/GPU Temperatures** with color coding:



### Quick Gaming Setup  - 🟢 Green: < 60°C (normal)- Settings reference

```bash

sudo ./msi-ec-control  - 🟡 Yellow: 60-75°C (warm)

# Select [4] Gaming Mode

```  - 🔴 Red: > 85°C (critical)- Troubleshooting guide3. CLI usage examples:



### Save Your Configuration- **Trend Indicators**: ↑ rising, ↓ falling, → stable

```bash

sudo ./msi-ec-control- **Visual bars** for temperature levels- Development guide

# Configure your settings manually

# Select [14] Save Profile- **Fan speeds** in RPM

# Enter profile name: "my-config"

```- **All toggles** and their current state# Simple CLI (Python)



### Monitor Temperatures- **Firmware version** and release date

```bash

sudo ./msi-ec-control## ⚡ Features

# Select [2] Real-time Monitor

# Press 'S' to stop monitoring## 💾 Profile System

```

./run-cli.sh --status```bash

## 🛠️ Troubleshooting

Profiles save:

### "MSI EC module not found" error

```bash- Fan mode- ✅ Simple interactive menu with 6 options

# Check if module is loaded

lsmod | grep msi_ec- Shift mode



# Check if sysfs path exists- Cooler boost state- ✅ Modern PyQt6 GUI with real-time monitoringsudo ./run-cli.sh --set-fan-mode silent# show current state

ls /sys/devices/platform/msi-ec

```- Super battery state



### Permission Denied- Webcam state- ✅ Advanced CLI with profiles and analysis

```bash

# Always run with sudo- Windows key state

sudo ./msi-ec-control

```- Keyboard backlight level- ✅ Desktop shortcuts for easy access```./run-cli.sh --status



### Settings Not Applying

- Some features may not be available on all MSI laptop models

- Check kernel module logs: `dmesg | grep msi-ec`Stored in: `~/.config/msi-ec-control/profiles/`- ✅ Color-coded temperature monitoring

- Verify your laptop is supported by the msi-ec module



## 🤝 Contributing

## 📈 Thermal Analysis- ✅ Performance presets (Turbo, Quiet, Balanced)

Contributions are welcome! Please feel free to submit a Pull Request.



1. Fork the repository

2. Create your feature branch (`git checkout -b feature/AmazingFeature`)The 30-second analysis:

3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)

4. Push to the branch (`git push origin feature/AmazingFeature`)- Takes 15 temperature samples (one every 2 seconds)

5. Open a Pull Request

- Calculates average and maximum temperatures## 📋 Requirements## 📦 What's Included# set fan mode (requires root/sudo for writes)

## 📜 License

- Provides personalized recommendations

This project is licensed under the MIT License - see the [LICENSE](docs/LICENSE) file for details.

- Suggests specific settings if temps are high

## 🙏 Acknowledgments



- **MSI EC Kernel Module** - [BeardOverflow/msi-ec](https://github.com/BeardOverflow/msi-ec)

- Thanks to all MSI laptop users who contributed to the kernel module development## 📜 History Log- MSI laptop with `msi-ec` kernel module loadedsudo ./run-cli.sh --set-fan-mode auto



## 👤 Author



**Yousef Osama (YousefE1bana)**All actions are logged to: `~/.config/msi-ec-control/history.log`- Python 3.7+ (for GUI)

- Cybersecurity Engineering Student at Egyptian Chinese University

- GitHub: [@YousefE1bana](https://github.com/YousefE1bana)- Maximum 100 entries kept



## 🌟 Show Your Support- Includes timestamp and action details- PyQt6, tabulate (auto-installed in venv)### 1. GUI Application (`gui.py`)



Give a ⭐️ if this project helped you control your MSI laptop!



## 📞 Support## 🔧 Installation- Root privileges for write operations



For issues, questions, or suggestions:

- Open an issue on [GitHub Issues](https://github.com/YousefE1bana/msi-ec-for-msi-laptops/issues)

- Check the [MSI EC kernel module documentation](https://github.com/BeardOverflow/msi-ec)1. Ensure `msi-ec` kernel module is loaded:**Features:**# enable cooler boost



---   ```bash



**Made with ❤️ for MSI laptop users**   ls /sys/devices/platform/msi-ec## 📜 License


   ```

- Real-time temperature monitoring (updates every 2s)sudo ./run-cli.sh --cooler-boost enable

2. Make executable:

   ```bashMIT License - Free to use and modify

   chmod +x msi-ec-control

   ```- Color-coded temps: 🟢 <60°C | 🟡 60-80°C | 🔴 >80°C



3. Run with sudo:- Fan mode: auto, silent, advanced# toggle webcam

   ```bash

   sudo ./msi-ec-control- Shift mode: eco, comfort, turbosudo ./run-cli.sh --toggle webcam

   ```

- Quick presets: Turbo Mode, Quiet Mode```

4. Optional - Install desktop shortcut:

   ```bash- Toggle: Cooler Boost, Webcam, Keyboard Backlight, Super Battery, Windows Key

   cp config/msi-control-center.desktop ~/.local/share/applications/

   cp config/msi-control-center.desktop ~/Desktop/4. GUI:

   chmod +x ~/Desktop/msi-control-center.desktop

   ```**Run:** `./run-gui-sudo.sh` or use Desktop shortcut



## 🛠️ Troubleshooting```bash



**"MSI EC module not found" error:**### 2. Advanced CLI (`msi-ec-cli-advanced.sh`)./run-gui.sh

- Check if module is loaded: `lsmod | grep msi_ec`

- Verify sysfs path exists: `ls /sys/devices/platform/msi-ec`**Features:**```



**"Permission denied" errors:**- 🌡️ Temperature bars with trend indicators (↑↓→)

- Always run with `sudo ./msi-ec-control`

- Check file permissions on sysfs files- 🔄 Real-time monitoring mode**Alternative:** Activate venv manually and run directly:



**Settings not applying:**- 📈 30-second thermal analysis with recommendations

- Some laptops may not support all features

- Check dmesg for kernel module errors: `dmesg | grep msi-ec`- 🎮 Quick presets: Gaming, Balanced, Silent```bash



## 📁 Project Structure- 💾 Profile save/load systemsource venv/bin/activate



```- 📜 History tracking (last 100 actions)./msi-ec-cli --status

msi-ec-control/

├── msi-ec-control           # Main executable (all-in-one)- 💨 CPU & GPU fan speed displaypython3 gui.py

├── config/

│   └── msi-control-center.desktop    # Desktop shortcut- ⚙️ Firmware info display```

├── docs/

│   ├── README.md            # Detailed documentation

│   └── LICENSE              # MIT License

└── README.md                # This file**Run:** `sudo ./msi-ec-cli-advanced.sh` or use Desktop shortcutThe GUI shows CPU/GPU temperatures with colored indicators:

```

- **Green** background: temperatures < 60°C (normal)

## 📜 License

### 3. Python CLI (`msi-ec-cli`)- **Yellow** background: temperatures 60-80°C (warm)

MIT License - Free to use and modify

**Features:**- **Red** background: temperatures > 80°C (hot)

## 🙏 Credits

- Simple command-line interface

Based on the `msi-ec` kernel module for MSI laptop control.

- Status table with tabulateTesting without hardware

---

- Direct setting changes------------------------

**Enjoy full control of your MSI laptop! 🚀**

- Scriptable/automation friendly

If you don't have the msi-ec module loaded or want to test the tools safely, use the demo mock:

**Examples:**

```bash```bash

./run-cli.sh --status# Create a mock sysfs structure in /tmp

sudo ./run-cli.sh --set-fan-mode auto./demo_mock_sysfs.py

sudo ./run-cli.sh --set-shift-mode turbo

sudo ./run-cli.sh --cooler-boost enable# Edit msi_ec_utils.py and change BASE to:

sudo ./run-cli.sh --toggle webcam#   BASE = Path("/tmp/msi-ec-demo")

```

# Now run the CLI or GUI against the mock data

### 4. Original Bash Script (`msi-ec-cli.sh`)./msi-ec-cli --status

Simple interactive bash menu (your original script, still available).python3 gui.py

```

## 📁 Project Structure

Notes and assumptions

```---------------------

msi-ec-control/- This code assumes certain sysfs filenames (fan_mode, shift_mode, cpu_temp, gpu_temp, cooler_boost, etc.).

├── gui.py                       # PyQt6 GUI application- If your platform uses different names, edit `KNOWN_FILES` in `msi_ec_utils.py`.

├── msi-ec-cli                   # Python CLI tool- Writing to sysfs requires appropriate permissions (root or udev rules). Use `sudo` for writes where necessary.

├── msi-ec-cli-advanced.sh       # Advanced bash menu (680 lines, 16 options)

├── msi-ec-cli.sh                # Original bash menu (simple)Security

├── msi_ec_utils.py              # Shared Python utilities--------

├── run-gui-sudo.sh              # GUI launcher (with root)- This tool writes directly to kernel-provided sysfs files. Be careful and only use on supported hardware.

├── run-cli.sh                   # Python CLI launcher (uses venv)

├── demo_mock_sysfs.py           # Testing helper (creates mock data)Contributing / Next steps

├── verify-setup.sh              # Verify venv is working-------------------------

├── requirements.txt             # Python dependencies- Add unit tests that mock sysfs.

├── venv/                        # Virtual environment (isolated packages)- Add packaging (pip entry points) and a systemd service for background monitoring.

├── .vscode/settings.json        # VS Code Python config- Improve GUI styling and add icons/dark mode.

└── *.desktop                    # Desktop shortcuts- Add a tray icon for background monitoring and quick presets.

```- Create .deb/.rpm packages for easier installation.

- Add udev rules or PolKit policy for non-root write access.

## ⚙️ Installation

Project structure

### Virtual Environment (Already Set Up)-----------------

The project uses a Python venv to avoid conflicts with system packages:

```bash```

source venv/bin/activate  # If neededmsi-ec-control/

pip list | grep -E "(PyQt6|tabulate)"  # Verify packages├── msi_ec_utils.py              # Shared utilities (read/write sysfs)

```├── msi-ec-cli                   # CLI tool (executable Python script)

├── gui.py                       # PyQt6 GUI app

### Desktop Integration├── demo_mock_sysfs.py           # Helper to create a mock sysfs for testing

Desktop shortcuts are already installed at:├── msi-control-center.desktop   # Desktop entry for GUI launcher (optional)

- `~/Desktop/msi-control-center.desktop` (GUI)├── requirements.txt             # Python dependencies

- `~/Desktop/msi-ec-advanced-cli.desktop` (CLI)├── LICENSE                      # MIT License

├── .gitignore                   # Git ignore patterns

### Manual Install└── README.md                    # This file

If shortcuts are missing:```

```bash

cp msi-control-center.desktop ~/Desktop/All tools depend on `msi_ec_utils.py` for low-level operations.

cp msi-ec-advanced-cli.desktop ~/Desktop/

chmod +x ~/Desktop/*.desktop### Desktop integration

```

To add the GUI to your application menu, copy the `.desktop` file:

## 🎯 Usage Examples

```bash

### Gaming Sessioncp msi-control-center.desktop ~/.local/share/applications/

**GUI:** Click "Turbo Mode" buttonupdate-desktop-database ~/.local/share/applications/

**CLI:** Press `4` (Gaming Mode)```

**Python:** `sudo ./run-cli.sh --set-fan-mode advanced --set-shift-mode turbo`


### Silent Mode (Battery Saving)
**GUI:** Click "Quiet Mode" button
**CLI:** Press `6` (Silent Mode)

### Monitor Temperatures
**GUI:** Leave window open (auto-refreshes)
**CLI:** Press `2` (Real-time monitor with trends)

### Thermal Analysis
**CLI only:** Press `3` (30s analysis with recommendations)

### Save Your Settings
**CLI:** Press `12` → Enter profile name → Settings saved
**Load:** Press `13` → Enter profile name

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
