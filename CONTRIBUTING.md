# Contributing to MSI EC Control Center

Thank you for your interest in contributing to MSI EC Control! This project helps MSI laptop users on Linux, and community contributions are welcome.

## 🤝 How to Contribute

### Reporting Bugs

If you find a bug, please open an issue with:

- **Laptop Model**: Your specific MSI laptop model
- **OS & Kernel**: Linux distribution and kernel version (`uname -r`)
- **Steps to Reproduce**: Clear steps to trigger the bug
- **Expected Behavior**: What should happen
- **Actual Behavior**: What actually happens
- **Module Status**: Output from `lsmod | grep msi_ec`
- **Kernel Logs**: Relevant output from `dmesg | grep msi-ec`
- **Script Version**: Output from `./msi-ec-control --version`

### Suggesting Features

Feature requests are welcome! Please open an issue with:

- Clear description of the feature
- Use case: Why is this useful?
- Examples: How would it work?
- Impact: Who would benefit?

### Submitting Code

1. **Fork the repository**
   ```bash
   # Fork on GitHub, then clone your fork
   git clone https://github.com/YOUR_USERNAME/msi-ec-cli-for-msi-laptops.git
   cd msi-ec-cli-for-msi-laptops
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   # Or for bug fixes:
   git checkout -b fix/bug-description
   ```

3. **Make your changes**
   - Follow the code style guide below
   - Test on real hardware if possible
   - Update documentation if needed
   - Add yourself to the contributors list

4. **Test your changes**
   ```bash
   # Test help and version
   ./msi-ec-control --help
   ./msi-ec-control --version

   # Test with hardware (requires MSI laptop)
   sudo ./msi-ec-control

   # Check for syntax errors
   bash -n msi-ec-control

   # Use shellcheck if available
   shellcheck msi-ec-control
   ```

5. **Commit your changes**
   ```bash
   git add .
   git commit -m "Add amazing feature"

   # Use descriptive commit messages:
   # - "Add support for battery threshold control"
   # - "Fix temperature reading for GS66 model"
   # - "Update README with installation for Fedora"
   ```

6. **Push to your fork**
   ```bash
   git push origin feature/amazing-feature
   ```

7. **Open a Pull Request**
   - Go to the original repository on GitHub
   - Click "New Pull Request"
   - Select your branch
   - Fill out the PR template
   - Link any related issues

## 📝 Code Style Guide

### Bash Script Guidelines

- **Indentation**: Use 2 spaces (no tabs)
- **Line Length**: Aim for 80 characters, max 120
- **Quotes**: Always quote variables: `"$variable"`
- **Functions**: Use descriptive names with underscores: `get_cpu_temp()`
- **Error Handling**: Check return codes and handle errors
- **Comments**: Add comments for complex logic

### Good Example
```bash
get_cpu_temperature() {
  local temp_file="$EC_PATH/cpu/realtime_temperature"
  if [ -f "$temp_file" ]; then
    cat "$temp_file" 2>/dev/null || echo "N/A"
  else
    echo "N/A"
  fi
}
```

### Bad Example
```bash
function getCPUTemp {
temp=$EC_PATH/cpu/realtime_temperature # Don't quote, bad name
cat $temp # No error handling
}
```

### Variable Naming
- `UPPER_CASE` for constants: `MAX_HISTORY=100`
- `lower_case` for local variables: `cpu_temp=65`
- Descriptive names: `temperature` not `tmp`

### Function Structure
```bash
function_name() {
  # 1. Declare local variables
  local var1="$1"
  local result=""

  # 2. Validate inputs
  if [ -z "$var1" ]; then
    return 1
  fi

  # 3. Main logic
  result=$(some_command "$var1")

  # 4. Return or echo result
  echo "$result"
  return 0
}
```

## 🧪 Testing

### Manual Testing Checklist

Before submitting a PR, test:

- [ ] Script runs without errors
- [ ] `--help` flag displays help
- [ ] `--version` flag shows version
- [ ] Menu displays correctly
- [ ] All menu options work
- [ ] Profile save/load works
- [ ] Real-time monitoring works
- [ ] Temperature colors display correctly
- [ ] No errors in `dmesg` after running
- [ ] Works with and without sudo (where appropriate)

### Hardware Testing

If you have an MSI laptop:
- [ ] Test fan mode changes
- [ ] Test shift mode changes
- [ ] Test hardware toggles
- [ ] Verify temperatures read correctly
- [ ] Check fan speeds display properly
- [ ] Test on battery and AC power

## 📚 Documentation

When contributing, update documentation:

- **README.md**: For user-facing changes
- **INSTALLATION.md**: For setup changes
- **CHANGELOG.md**: Add entry for your change
- **Code comments**: Explain complex logic
- **Help text**: Update `show_help()` if needed

## 🔍 Code Review Process

Pull requests will be reviewed for:

1. **Functionality**: Does it work as intended?
2. **Code Quality**: Is it clean and maintainable?
3. **Testing**: Has it been tested on hardware?
4. **Documentation**: Are docs updated?
5. **Style**: Does it follow the style guide?
6. **Compatibility**: Does it work on different systems?

Reviewers may request changes. Please respond constructively and update your PR.

## 🐛 Debugging Tips

### Enable Verbose Mode
```bash
# Add this to the script temporarily
set -x  # Enable debug mode
```

### Check sysfs Files
```bash
# List all available controls
ls -la /sys/devices/platform/msi-ec/

# Read a specific value
cat /sys/devices/platform/msi-ec/fan_mode

# Watch for changes
watch -n 1 cat /sys/devices/platform/msi-ec/cpu/realtime_temperature
```

### Check Kernel Logs
```bash
# See recent MSI EC messages
dmesg | grep msi-ec | tail -20

# Watch live
dmesg -w | grep msi-ec
```

## 💻 Development Environment

### Recommended Tools

- **shellcheck**: Bash linter
  ```bash
  # Install
  sudo apt install shellcheck  # Debian/Ubuntu
  sudo pacman -S shellcheck    # Arch

  # Use
  shellcheck msi-ec-control
  ```

- **shfmt**: Bash formatter
  ```bash
  # Install
  go install mvdan.cc/sh/v3/cmd/shfmt@latest

  # Format
  shfmt -i 2 -w msi-ec-control
  ```

- **Git**: Version control
  ```bash
  git config --global user.name "Your Name"
  git config --global user.email "your.email@example.com"
  ```

## 📋 Project Structure

```
msi-ec-control/
├── msi-ec-control           # Main executable (single-file)
├── config/                  # Desktop integration
│   └── msi-control-center.desktop
├── docs/                    # Additional documentation
│   ├── LICENSE
│   └── README.md
├── README.md                # Main documentation
├── INSTALLATION.md          # Setup guide
├── CHANGELOG.md             # Version history
├── CONTRIBUTING.md          # This file
└── .gitignore               # Git ignore patterns
```

## 🎯 Areas for Contribution

### High Priority
- [ ] Testing on different MSI laptop models
- [ ] Improving error messages
- [ ] Adding validation for user inputs
- [ ] Cross-distribution testing

### Medium Priority
- [ ] Adding command-line arguments for scripting
- [ ] Creating automated tests
- [ ] Improving installation process
- [ ] Adding more presets

### Nice to Have
- [ ] Web interface
- [ ] GUI application
- [ ] Configuration file support
- [ ] Multi-language support
- [ ] Background daemon mode

## 👥 Community

- **Issues**: [GitHub Issues](https://github.com/YousefE1bana/msi-ec-cli-for-msi-laptops/issues)
- **Discussions**: Use GitHub Discussions for questions
- **MSI EC Module**: [BeardOverflow/msi-ec](https://github.com/BeardOverflow/msi-ec)

## 📜 License

By contributing, you agree that your contributions will be licensed under the MIT License.

## 🙏 Recognition

Contributors will be recognized in:
- README.md (Contributors section)
- CHANGELOG.md (for their changes)
- Git commit history

## ❓ Questions?

If you have questions about contributing:
1. Check existing issues and discussions
2. Read the README and documentation
3. Open a new discussion on GitHub
4. Reach out to the maintainers

---

**Thank you for contributing to MSI EC Control Center!** 🎉

Your contributions help make Linux better for MSI laptop users.
