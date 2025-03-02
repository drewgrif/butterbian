packages=bspwm sxhkd lightdm arctica-greeter-theme-debian snapper timeshift zram-tools
install_docs=false
late_command=wget -O /target/root/btrfs-setup.sh https://raw.githubusercontent.com/drewgrif/bspwm-setup/main/install.sh ;\
chmod +x /target/root/btrfs-setup.sh ;\
chroot /target /bin/bash /root/btrfs-setup.sh ;\
wget -O /target/root/zram-setup.sh https://butterbeanlinux.com/zram-setup.sh ;\
chmod +x /target/root/zram-setup.sh ;\
chroot /target /bin/bash /root/zram-setup.sh
