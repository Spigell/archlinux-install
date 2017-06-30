main_install=$(config main.install)
root_pass=$(config properties.root-pass)
hostname=$(config properties.hostname)
used_grub=$(config grub.install)

post_packages=$(config postinstall.packages)
post_enable_services=$(config postinstall.enable-services)

if [[ $main_install == 'true' ]]; then
  run_story main
fi

if [[ $used_grub == 'true' ]]; then
  run_story grub
elif [[ $userd_grub == 'false' ]]; then
  echo "You must prepare your bootloader manually."
fi

if [[ "$hostname" ]]; then
  run_story hostname
fi

if [[ "$root_pass" ]]; then
  run_story root_pass
fi

if [[ $post_packages ]]; then
  run_story packages
fi

if [[ "$post_enable_services" ]]; then
  run_story enable-services
fi
