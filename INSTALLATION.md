# Installation Guide

Complete guide to install the MSI EC kernel module and MSI EC Control Center.

## Overview

This project requires two components:
1. **MSI EC Kernel Module** - The driver that interfaces with your MSI laptop hardware
2. **MSI EC Control Center** - This control application (bash script)

## Prerequisites

- MSI laptop (check compatibility list)
- Linux kernel headers installed
- Git installed
- Root/sudo access

## Step 1: Install Kernel Headers

First, ensure you have kernel headers installed:

```bash
# For Debian/Ubuntu/Kali
sudo apt update
sudo apt install linux-headers-$(uname -r) build-essential git

# For Arch/Manjaro
sudo pacman -S linux-headers base-devel git

# For Fedora
sudo dnf install kernel-devel kernel-headers gcc make git
```

## Step 2: Install MSI EC Kernel Module

### Clone the MSI EC Module

```bash
# Clone the forked MSI EC kernel module
git clone https://github.com/YousefE1bana/msi-ec-for-msi-laptops.git
cd msi-ec-for-msi-laptops
```

### Build and Load the Module

```bash
# Build the kernel module
make

# Load the module temporarily (test)
sudo insmod msi-ec.ko

# Verify the module is loaded
lsmod | grep msi_ec

# Check if sysfs interface is available
ls /sys/devices/platform/msi-ec/
```

You should see various files like `fan_mode`, `shift_mode`, `cpu/`, `gpu/`, etc.

### Make Module Load Automatically (Optional but Recommended)

To load the module automatically on boot:

```bash
# Install the module to system
sudo make install

# Load the module
sudo modprobe msi-ec

# Add to modules to load at boot
echo "msi-ec" | sudo tee -a /etc/modules

# Or for systemd-based systems, create a config file
echo "msi-ec" | sudo tee /etc/modules-load.d/msi-ec.conf
```

### Verify Installation

```bash
# Check module info
modinfo msi-ec

# Check if loaded
lsmod | grep msi_ec

# Verify sysfs interface
ls -la /sys/devices/platform/msi-ec/
```

## Step 3: Install MSI EC Control Center

Now that the kernel module is working, install the control center:

```bash
# Go back to home directory
cd ~

# Clone the MSI EC Control Center
git clone https://github.com/YousefE1bana/msi-ec-control-center.git
cd msi-ec-control-center

# Make the script executable
chmod +x msi-ec-control

# Test run
sudo ./msi-ec-control
```

### Install Desktop Shortcut (Optional)

```bash
# Install to applications menu
cp config/msi-control-center.desktop ~/.local/share/applications/

# Add to desktop
cp config/msi-control-center.desktop ~/Desktop/
chmod +x ~/Desktop/msi-control-center.desktop
```

### Create System-Wide Installation (Optional)

For system-wide access:

```bash
# Copy script to /usr/local/bin
sudo cp msi-ec-control /usr/local/bin/
sudo chmod +x /usr/local/bin/msi-ec-control

# Now you can run from anywhere
sudo msi-ec-control
```

## Step 4: Verify Everything Works

```bash
# Check if module is loaded
lsmod | grep msi_ec

# Check sysfs files
ls /sys/devices/platform/msi-ec/

# Run the control center
sudo msi-ec-control
```

## Quick Start After Installation

Once everything is installed:

```bash
# Just run:
sudo msi-ec-control

# Or click the desktop shortcut: "MSI EC Control"
```

## Troubleshooting

### Module Won't Load

```bash
# Check kernel logs
dmesg | grep msi-ec

# Try to load with verbose output
sudo insmod msi-ec.ko
```

### "Module not found" Error

```bash
# Rebuild the module
cd ~/msi-ec-for-msi-laptops
make clean
make
sudo insmod msi-ec.ko
```

### "No such device" Error

Your laptop might not be supported. Check the compatibility list in the MSI EC repository.

### Permission Denied

Always run the control center with sudo:
```bash
sudo ./msi-ec-control
```

### Module Doesn't Load on Boot

```bash
# Check if module is in the right place
ls /lib/modules/$(uname -r)/extra/msi-ec.ko

# Rebuild module database
sudo depmod -a

# Try loading manually
sudo modprobe msi-ec
```

## Updating

### Update the Kernel Module

```bash
cd ~/msi-ec-for-msi-laptops
git pull
make clean
make
sudo rmmod msi-ec  # Unload old module
sudo insmod msi-ec.ko  # Load new module
```

### Update the Control Center

```bash
cd ~/msi-ec-control-center
git pull
chmod +x msi-ec-control
```

## Uninstallation

### Remove Control Center

```bash
cd ~/msi-ec-control-center
rm -rf ~/msi-ec-control-center
rm ~/.local/share/applications/msi-control-center.desktop
rm ~/Desktop/msi-control-center.desktop
sudo rm /usr/local/bin/msi-ec-control  # If installed system-wide
```

### Remove Kernel Module

```bash
# Unload module
sudo rmmod msi-ec

# Remove from auto-load
sudo rm /etc/modules-load.d/msi-ec.conf
# Or edit /etc/modules and remove the line

# Remove installed files
cd ~/msi-ec-for-msi-laptops
sudo make uninstall

# Remove source
rm -rf ~/msi-ec-for-msi-laptops
```

## Support

- **Control Center Issues**: [GitHub Issues](https://github.com/YousefE1bana/msi-ec-control-center/issues)
- **Kernel Module Issues**: [MSI EC Module Issues](https://github.com/YousefE1bana/msi-ec-for-msi-laptops/issues)
- **Original MSI EC Project**: [BeardOverflow/msi-ec](https://github.com/BeardOverflow/msi-ec)

## Notes

- Always keep the kernel module updated when you update your kernel
- The control center requires the kernel module to be loaded
- Some features may not be available on all MSI laptop models
- Use with caution - incorrect settings can affect system stability

---

**Ready to control your MSI laptop!** 🚀
