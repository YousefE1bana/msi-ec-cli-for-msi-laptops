# Changelog

All notable changes to MSI EC Control Center will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2025-03-18

### Added
- Profile save/load system for storing custom configurations
- 30-second thermal analysis with personalized recommendations
- Real-time monitoring mode with auto-refresh every 2 seconds
- History logging system (tracks last 100 actions)
- Temperature color coding (Green/Yellow/Red for different thresholds)
- Temperature trend indicators (↑ rising, ↓ falling, → stable)
- Visual temperature progress bars
- Desktop shortcut integration for easy access
- Command-line help flag (`--help`, `-h`)
- Command-line version flag (`--version`, `-v`)
- Quick presets: Gaming Mode, Balanced Mode, Silent Mode
- Action history viewer (last 20 actions)
- Configuration directory at `~/.config/msi-ec-control`

### Changed
- Improved error handling with detailed messages
- Enhanced temperature display with visual indicators
- Better organization of code with modular functions
- Updated version to 2.0.0 for semantic versioning
- Fixed hardcoded path in desktop file for portability

### Fixed
- Desktop shortcut now works for all users (removed hardcoded path)
- Better handling of missing sysfs files

## [1.0.0] - 2024-12-XX

### Added
- Initial release of MSI EC Control Center
- Basic fan mode control (auto/silent/advanced)
- Shift mode control (eco/comfort/turbo)
- Hardware toggle controls:
  - Cooler Boost (on/off)
  - Super Battery mode (on/off)
  - Webcam enable/disable
  - Windows Key enable/disable
  - Keyboard backlight control (0-3 brightness levels)
- Real-time CPU and GPU temperature reading
- Fan speed monitoring (CPU and GPU)
- Interactive menu system with 18 options
- Color-coded terminal interface
- Basic system status display
- Support for MSI EC kernel module interface

### Requirements
- MSI laptop with msi-ec kernel module installed
- Linux kernel headers
- Root/sudo access for hardware control
- Bash 5.0 or higher

---

## Future Releases

### [Unreleased]
Ideas for future versions:
- Command-line arguments for direct control (`--fan`, `--shift`, etc.)
- Background daemon mode for continuous monitoring
- Temperature alert notifications
- Fan curve customization
- Web interface for remote control
- Integration with system power profiles
- Automated testing suite
- Multi-language support
- Configuration file support

---

## Version History Summary

- **2.0.0** - Major feature update with profiles, monitoring, and analysis
- **1.0.0** - Initial release with basic hardware controls

For detailed information about each version, see the sections above.
