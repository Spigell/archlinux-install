used_grub=$(config grub.install)
main_install=$(config main.install)
packages=$(config packages)
services=$(config enable-service)

if [[ $main_install == 'true' ]]; then
  run_story main
fi
if [[ $used_grub == 'true' ]]; then
  run_story grub
elif [[ $userd_grub == 'false' ]]; then
  echo "You must prepare your bootloader manually."
fi

if [[ $packages ]]; then
  run_story packages
fi
if [[ $services ]]; then
  run_story enable-services
fi
