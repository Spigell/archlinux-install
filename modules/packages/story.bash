debug=$(config debug)
[[ $debug ]] && set -x

packages=$(config packages)

for package in $packages; do
  arch-chroot /mnt pacman -S --noconfirm $package
done
