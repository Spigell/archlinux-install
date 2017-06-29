used_grub=$(config grub.install)
main_install=$(config main.install)
post_packages=$(config postinstall.packages)
post_enable_services=$(config postinstall.enable-service)

if [[ $main_install == 'true' ]]; then
  run_story main
fi

if [[ $used_grub == 'true' ]]; then
  run_story grub
elif [[ $userd_grub == 'false' ]]; then
  echo "You must prepare your bootloader manually."
fi

if [[ $post_packages ]]; then
  run_story packages
fi

if [[ "$post_enable_services" ]]; then
  run_story enable-services
fi
