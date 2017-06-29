debug=$(config grub.debug)

if [[ $debug ]] && set -x

grub_target=$(config grub.target)
grub_type=$(config grub.type)
grub_partition=$(config grub.partition)

if [[ $grub_target ]]; then
  arch-chroot /mnt pacman -S --noconfirm grub os-prober 
  if [[ $grub_type == 'efi' ]] && [[ $grub_partition ]]; then
	real_efi_partition=$(fdisk -o Type,Device -l $grub_target | grep EFI | cut -f 3 -d " ")
    if [[ $real_efi_partition == $grub_partition ]]; then
	  mkfs.fat -F32 $grub_partition
	  mkdir /mnt/boot/efi
	  arch-chroot /mnt pacman -S --noconfirm efibootmgr
	  mount $grub_partition /mnt/boot/efi
	else
	  echo "It seems your desired partition ( $grub_partition) is not a ESP. Check it."
	  [[ -z $real_efi_partition ]] && echo "Your disk doesn't have ESP."
	  exit 3
	fi
  fi
  arch-chroot /mnt grub-install $grub_target
  arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg
fi
