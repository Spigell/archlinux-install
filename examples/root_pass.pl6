set_spl %( dev-archlinux-install => 'https://github.com/Spigell/archlinux-install' );

task-run "set root pass", "dev-archlinux-install", %(
  main   => %( 
    install => 'false',
  ),
  grub  => %( 
    install => 'false',
  ),
  system => %(
    root-pass => 'koteika42';
  )
);
