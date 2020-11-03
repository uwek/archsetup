# curl -L https://is.gd/dVV0jV

function step1 () {
## fdisk /dev/sda
## wifi-menu
mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt
pacstrap /mnt base wireless_tools netctl iw dialog wpa_supplicant vim linux linux-firmware acpi htop grub
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
}

function step2() {
  echo textonly > /etc/hostname
  sed -i 's/#de_DE.UTF-8/de-DE.UTF-8/' /etc/locale.gen
  locale-gen
  echo LANG=de_DE.UTF-8 > /etc/locale.conf
  localectl set-keymap de-latin1-nodeadkeys
  hwclock --systohc
  ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
  pacman -S grub
  grub-install --target=i386-pc /dev/sda
  grub-mkconfig -o /boot/grub/grub.cfg 
}

step2

# wifi-menu
# netctl list 
# netctl enable wlp1s0-WLAN-589717
# netctl start wlp1s0-WLAN-589717 
# pacman -S sudo vim openssh wget 
# useradd -m -G wheel -s /bin/bash user
# vi /etc/sudoers 
# passwd user
# pacman -S base-devel git wget mc git 
