debug=$(config debug)
[[ $debug ]] && set -x

hostname=$(config properties.hostname)

arch-chroot /mnt /bin/bash -c "echo $hostname > /etc/hostname"
