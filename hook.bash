used_grub=$(config grub.install)
main_install=$(config main.install)

if [[ $main_install == 'true' ]]; then
  run_story main
fi

if [[ $used_grub == 'true' ]]; then
  run_story grub
elif [[ $userd_grub == 'false' ]]; then
  echo "You must prepare your bootloader manually."
fi
