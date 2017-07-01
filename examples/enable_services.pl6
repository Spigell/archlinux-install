set_spl %( dev-archlinux-install => 'https://github.com/Spigell/archlinux-install' );

EVALFILE './copy-dev-dir.pl6';
task-run "enable services", "dev-archlinux-install", %(
  main   => %( 
    install => 'false',
  ),
  grub  => %( 
    install => 'false',
  ),
  postinstall => %(
    enable-services => ('sshd NetworkManager');
  )
);
