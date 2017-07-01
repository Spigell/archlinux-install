set_spl %( dev-archlinux-install => 'https://github.com/Spigell/archlinux-install' );

EVALFILE './copy-dev-dir.pl6';
task-run "Install Archlinux", "dev-archlinux-install", %(
  lvm   => %( 
    vg   => 'vg_main',
    lv   => 'slashroot'
  ),
  grub  => %( 
    install => 'false',
  )
);
