set_spl %( dev-archlinux-install => 'https://github.com/Spigell/archlinux-install' );

EVALFILE './copy-dev-dir.pl6';
task-run "Install packages", "dev-archlinux-install", %(
  main   => %( 
    install => 'false',
  ),
  grub  => %( 
    install => 'false',
  ),
  postinstall => %(
    packages => ('openssh sudo networkmanager');
  )
);
