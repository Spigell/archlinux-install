used_grub=$(config grub.install)

  run_story main

if [[ $used_grub == 'true' ]]; then

  run_story grub
elif [[ $userd_grub == 'false' ]]; then
  echo "You must prepare your bootloader manually."
fi
