# SYNOPSIS

Outthentic plugin.

Since there is no an official installer for Archlinux, user has to install it manually. Such project as [Archfi](https://github.com/MatMoul/archfi/blob/master/archfi), [AUI](https://github.com/helmuthdu/aui) are quite heavy and install OS in interactive mode, this script makes automatic installation according to your configuration.

# INSTALL

    $ sparrow plg install archlinux-install

# USAGE

## via sparrow task    
    $ sparrow project create archlinux
    $ sparrow task add archlinux install archlinux-install

Add configuration in your config file (yaml, json or Config::General):

    $ sparrow task ini archlinux/install

    system:
      hostname: Arch-test
      root-pass: koteika42
    disk:
      lvm:
        vg: vg_main
        lv: slashroot
    bootloader:
      grub:
        install: true
        type: efi
        target: /dev/sda

    $ sparrow task run archlinux/install

## via sparrowdo

    $ cat sparrowfile
    task-run "Install Archlinux", "archlinux-install", %(
      system => %( 
        hostname => 'Arch',
      ),
      disk => %(
        lvm  => %(
          vg   => 'vg_main',
          lv   => 'slashroot',
        ),
      ),
      bootloader => %(
        grub   => %(
          install   => 'true',
          type      => 'efi',
          target    => '/dev/sda',
          partition => '/dev/sda2',
        ),
      ),
      postinstall => %(
        packages        => ('openssh sudo networkmanager'),
        enable-services => ('sshd NetworkManager dhcpcd'),
      ),
    );

For more examples see here - [Archlinux sparrowfiles](https://github.com/Spigell/sparrow-sparrowdo-examples/tree/master/archlinux_scenarios)

# Parameters
## system part
### root-pass
Your root password.

### hostname
Name of host.

## disc part
### LVM
#### vg
Your volume group. It must be already created.

#### lv
Your logical volume. It must be already created.

## bootloader part
### GRUB
#### install
One of two: (true|false). Default is `false`.

#### type
Supported types: 
 - efi
 - bios

#### target
Your phisical disk for install grub.

#### partition
Your desired partition for install grub. For efi must be ESP type.
No need for `bios` installation.

## postinstall part
### packages
list of packages to install after installation. Separated by space. 
*Note* It is not a array. Must be a string.

### enable-services
list of services (systemd units) to enable. Separated by space.
*Note* It is not a array. Must be a string.
