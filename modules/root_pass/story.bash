debug=$(config debug)
[[ $debug ]] && set -x

root_pass=$(config system.root-pass)

arch-chroot /mnt /bin/bash -c "echo root:"$root_pass" | chpasswd"
