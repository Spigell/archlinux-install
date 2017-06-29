debug=$(config debug)

[[ $debug ]] && set -x 

raw_part=$(config disk.partition)
lvm_vg=$(config lvm.vg)
lvm_lv=$(config lvm.lv)

if [[ -n $raw_part ]] && [[ -n $lvm_vg ]]; then
  echo "Choose one. Raw partition (e.g. /dev/sda1) or lvm"
  exit 1
fi

if [[ ! -n $lvm_vg ]] || [[ ! -n $lvm_lv ]]; then
  echo "I need volume group and logical volume"
  exit 1
fi

if [[  -n $lvm_vg ]] || [[  -n $lvm_lv ]]; then
  install_partition=/dev/mapper/${lvm_vg}-${lvm_lv}
  lvm_used='true'
else
  install_partition=$raw_part
fi

mkfs.ext4 $install_partition
mount $install_partition /mnt

mkdir /mnt/boot

pacstrap /mnt base

genfstab -U /mnt > /mnt/etc/fstab

if [[ $lvm_used == true ]] ;then
  MKINITCPIO_CONF=/mnt/etc/mkinitcpio.conf
  hooks=$(grep '^HOOKS=' $MKINITCPIO_CONF)
  if [[ ! `echo $hooks | grep lmv2` ]]; then
  sed -i.bak '/^HOOKS=/ s/\"$/ lvm2\"/' $MKINITCPIO_CONF 
  arch-chroot /mnt /bin/bash -c "mkinitcpio -p linux"
  fi
fi
