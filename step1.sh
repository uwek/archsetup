# curl -L https://is.gd/dVV0jV

## fdisk /dev/sda
## wifi-menu
# mkfs.ext4 /dev/sda1
# mount /dev/sda1 /mnt

pacstrap /mnt base wireless_tools netctl iw dialog wpa_supplicant vim linux linux-firmware acpi htop
