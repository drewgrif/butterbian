#!/bin/bash
set -e

echo "==> Starting Btrfs pre-install subvolume setup"

# Prompt user to confirm Btrfs partition device
lsblk -f
read -p "Enter the Btrfs partition (e.g., /dev/sda2): " DEVICE

# Confirm mount point
MOUNTPOINT="/mnt"

# Mount the Btrfs partition
mount "$DEVICE" "$MOUNTPOINT"

# Check for @rootfs (Debian auto-created subvolume) and rename it if found
if btrfs subvolume list "$MOUNTPOINT" | grep -q '@rootfs'; then
    echo "Detected @rootfs — renaming it to @"
    btrfs subvolume snapshot "$MOUNTPOINT/@rootfs" "$MOUNTPOINT/@"
    btrfs subvolume delete "$MOUNTPOINT/@rootfs"
fi

# Create subvolumes if they don't already exist
if ! btrfs subvolume list "$MOUNTPOINT" | grep -q '@$'; then
    echo "==> Creating subvolumes"
    btrfs subvolume create "$MOUNTPOINT/@"
    btrfs subvolume create "$MOUNTPOINT/@home"
    btrfs subvolume create "$MOUNTPOINT/@log"
    btrfs subvolume create "$MOUNTPOINT/@cache"
    btrfs subvolume create "$MOUNTPOINT/@snapshots"
else
    echo "==> Subvolumes already exist — skipping creation"
fi

# Unmount and remount @ subvolume
umount "$MOUNTPOINT"
mount -o subvol=@ "$DEVICE" "$MOUNTPOINT"

# Reminder message
echo "==> Btrfs subvolumes are ready"
echo "==> IMPORTANT: During manual partitioning, you must mount:"
echo "    - $DEVICE (subvol=@) to /"
echo "    - Your EFI partition to /boot/efi"
echo "==> Press Enter to continue."
read
