set_spl %( dev-archlinux-install => 'https://github.com/Spigell/archlinux-install' );

EVALFILE './copy-dev-dir.pl6';
task-run "set root pass", "dev-archlinux-install", %(
  main   => %( 
    install => 'false',
  ),
  grub  => %( 
    install => 'false',
  ),
  properties => %(
    root-pass => 'koteika42';
  )
);
