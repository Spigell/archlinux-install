debug=$(config debug)
[[ $debug ]] && set -x

hostname=$(config system.hostname)

arch-chroot /mnt /bin/bash -c "echo $hostname > /etc/hostname"
