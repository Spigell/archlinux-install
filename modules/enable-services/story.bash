debug=$(config debug)
[[ $debug ]] && set -x

services=$(config enable-service)

for service in $services; do
  arch-chroot /mnt systemctl enable $service
done
