debug=$(config debug)
[[ $debug ]] && set -x

root_pass=$(config properties.root-pass)

arch-chroot /mnt /bin/bash -c "echo root:"$root_pass" | chpasswd"
