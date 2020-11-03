# curl -L https://is.gd/dVV0jV

# /dev/sda1 - boot
# parted /dev/sda mklabel msdos
# parted /dev/sda mkpart primary ext4 1 100%
mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt

