# Changelog

All notable changes to MSI EC Control Center will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.1.0] - 2026-03-21

### Added
- **Installation Script** (`install.sh`)
  - One-command installation for user or system-wide
  - Automatic prerequisite checking
  - Desktop integration setup
  - Uninstall option
  - Supports both user (`~/.local/bin`) and system (`/usr/local/bin`) installation

- **Configuration File Support**
  - User configuration file at `~/.config/msi-ec-control/config.conf`
  - Customizable temperature thresholds
  - Adjustable monitoring intervals
  - Configurable notification preferences
  - Color scheme customization
  - Auto-load profile option
  - Example configuration file included

- **Background Monitoring Service**
  - Standalone monitor script (`msi-ec-monitor`)
  - Systemd service file for automatic startup
  - Continuous temperature monitoring
  - Smart notification system (prevents spam)
  - Configurable check intervals
  - Logging to `~/.config/msi-ec-control/monitor.log`

- **Desktop Notifications**
  - Critical temperature alerts (>85°C by default)
  - High temperature warnings (>75°C by default)
  - Configurable notification urgency levels
  - Optional notification sounds
  - Can be disabled via config file

- **Documentation**
  - `IMPROVEMENT_PLAN.md` - Comprehensive roadmap for future enhancements
  - `NEW_FEATURES.md` - Detailed guide for new features
  - `PROJECT_FEEDBACK.md` - Professional project review and feedback
  - `CHANGELOG.md` - Version history and changes

### Changed
- **Desktop File** (`config/msi-control-center.desktop`)
  - Now uses dynamic paths instead of hardcoded user directory
  - Automatically configured during installation
  - Works for all users without manual editing

### Fixed
- Desktop shortcut now works correctly for all users
- Installation process is more robust and user-friendly

### Security
- Systemd service includes security hardening options
- Read-only access to system paths where possible
- No new privileges escalation in service

## [2.0.0] - 2026-03-19

### Added
- Initial release of advanced control center
- Real-time temperature monitoring with color-coded indicators
- 30-second thermal analysis with recommendations
- Profile save/load system
- Quick presets (Gaming, Balanced, Silent)
- Action history logging (last 100 entries)
- Temperature trend indicators (↑↓→)
- Support for all MSI EC features:
  - Fan mode control (auto/silent/advanced)
  - Shift mode control (eco/comfort/turbo)
  - Cooler boost toggle
  - Super battery mode
  - Webcam enable/disable
  - Windows key toggle
  - Keyboard backlight control (0-3)
- Desktop integration with .desktop file
- Comprehensive documentation (README.md, INSTALLATION.md)
- MIT License

### Technical Details
- 767 lines of bash code
- Proper error handling with `set -euo pipefail`
- Safe sysfs operations
- Modular function structure
- Configuration in `~/.config/msi-ec-control/`
- Profile storage in `~/.config/msi-ec-control/profiles/`

## [1.0.0] - 2025-xx-xx

### Added
- Initial basic version of MSI EC control script
- Basic fan and shift mode control
- Simple menu interface

---

## Planned Features (Roadmap)

See [IMPROVEMENT_PLAN.md](IMPROVEMENT_PLAN.md) for detailed roadmap.

### Phase 2 (Next Release)
- [ ] Command-line arguments for scripting
- [ ] Temperature logging to CSV
- [ ] Multiple desktop shortcuts for quick presets
- [ ] Enhanced thermal analysis

### Phase 3 (Future)
- [ ] Auto-profile switching based on running applications
- [ ] Web dashboard for remote monitoring
- [ ] GUI application (GTK/Qt)
- [ ] Package files (.deb, .rpm, AUR)

### Phase 4 (Long-term)
- [ ] Unit tests with bats
- [ ] Code modularization
- [ ] Multi-language support
- [ ] Fan curve customization

---

## Version Numbering

- **Major version** (X.0.0): Breaking changes or major feature additions
- **Minor version** (x.X.0): New features, backward compatible
- **Patch version** (x.x.X): Bug fixes and minor improvements

## Links

- [GitHub Repository](https://github.com/YousefE1bana/msi-ec-cli-for-msi-laptops)
- [Issue Tracker](https://github.com/YousefE1bana/msi-ec-cli-for-msi-laptops/issues)
- [Installation Guide](INSTALLATION.md)
- [New Features Guide](NEW_FEATURES.md)
- [Improvement Plan](IMPROVEMENT_PLAN.md)
