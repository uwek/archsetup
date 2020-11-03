## loadkeys de
## curl -L https://is.gd/dVV0jV

cat << EOF > step1.sh
  mkfs.ext4 /dev/sda1
  mount /dev/sda1 /mnt
  pacstrap /mnt base wireless_tools netctl iw dialog wpa_supplicant vim linux linux-firmware grub
  genfstab -U /mnt >> /mnt/etc/fstab
  cp step2.sh /mnt
  cp step3.sh /mnt
  echo
  echo start step2.sh ...
  echo
  arch-chroot /mnt
EOF

cat << EOF > step2.sh
  echo textonly > /etc/hostname
  sed -i 's/#de_DE.UTF-8/de_DE.UTF-8/' /etc/locale.gen
  locale-gen
  echo LANG=de_DE.UTF-8 > /etc/locale.conf
  localectl set-keymap de-latin1-nodeadkeys
  hwclock --systohc
  ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
  useradd -m -G wheel -s /bin/bash user
  grub-install --target=i386-pc /dev/sda
  grub-mkconfig -o /boot/grub/grub.cfg 
  echo
  echo time to reboot
  echo
EOF

cat << EOF > step3.sh
  # wifi-menu
  WIF=`netctl list`
  netctl enable $WIF
  netctl start $WIF
  pacman -S sudo openssh wget base-devel git wget mc git acpi htop 
  # vi /etc/sudoers 
  # passwd user
EOF

## fdisk /dev/sda
## wifi-menu
