# Butter Bean Linux - Simple-CDD Setup

This repository contains the configuration files needed to build the **Butter Bean Linux** custom Debian 12 installer using **Simple-CDD**.

## Features
- Btrfs root filesystem with subvolumes for snapshots
- Snapper preconfigured for system snapshots
- Optional Timeshift support
- bspwm as the default window manager
- LightDM with Arctica Greeter theme
- ZRAM swap (no traditional swap partition)

## Project Info
- Official Website: [butterbeanlinux.com](https://butterbeanlinux.com)
- Also available at: [butterbian.com](https://butterbian.com)
- Created for JustAGuy Linux (YouTube)

## Building the ISO
To build the ISO, run:
```bash
build-simple-cdd --conf simple-cdd.conf
