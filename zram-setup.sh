#!/bin/bash
set -e

echo "==> Installing zram-tools"
apt-get update
apt-get install -y zram-tools

echo "==> Configuring ZRAM"

cat <<EOF >/etc/default/zramswap
# ZRAM Configuration for Butter Bean Linux
ALLOCATION_RATIO=0.5
COMP_ALG="lz4"
EOF

systemctl enable --now zramswap.service

echo "==> ZRAM setup complete"
