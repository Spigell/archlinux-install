debug=$(config debug)
[[ $debug ]] && set -x

services=$(config postinstall.enable-services)

for service in $services; do
  arch-chroot /mnt systemctl enable $service
done
