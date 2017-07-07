set_spl %( dev-archlinux-install => 'https://github.com/Spigell/archlinux-install' );

task-run "Install Archlinux", "dev-archlinux-install", %(
  disk => %(
    raw   => %( 
      partition   => '/dev/sda1',
	),
  ),
);
