# SYNOPSIS

Outthentic plugin.

Since there is no an official installer for Archlinux, user has to install it manually. Such project as [Archfi](https://github.com/MatMoul/archfi/blob/master/archfi), [AUI](https://github.com/helmuthdu/aui) are quite heavy and install OS in interactive mode, this script makes automatic installation according to your configs.

# INSTALL

    $ sparrow plg install archlinux-install

# USAGE

## via sparrow task    
    $ sparrow project create archlinux
    $ sparrow task add archlinux install archlinux-install

Add configuration in your config file (yaml, json or Config::General):

    $ sparrow task ini archlinux/install

    properties:
      hostname: Arch-test
      root-pass: koteika42
    lvm:
      vg: vg_main
      lv: slashroot
    grub:
      install: true
      type: efi
      target: /dev/sda

    $ sparrow task run archlinux/install

## via sparrowdo

    $ cat sparrowfile
    task-run "Install Archlinux", "archlinux-install", %(
      lvm    => %(
        vg   => 'vg_main',
        lv   => 'slashroot'
      ),
      grub  => %(
        install => 'true',
        type    => 'efi',
        target  => '/dev/sda',
      )
    );

For more examples see here - [Archlinux sparrowfiles](https://github.com/Spigell/sparrow-sparrowdo-examples/tree/master/archlinux_scenarios)

# Parameters
## properties part
### root-pass
Your root password.

### hostname
Name of host.

## lvm part
### vg
Your volume group. It must be already created.

### lv
Your logical volume. It must be already created.

## grub part
### install
One of two: (true|false). Default is `false`.

### type
Supported types: efi.

### target
Your phisical disk for install grub.

### partition
Your desired partition for install grub. For efi must be ESP type.
No need for BIOS installation.

## postinstall part
### packages
list of packages to install after installation. Separated by space. 
*Note* It is not a array. Must be a string.

### enable-services
list of services (systemd units) to enable. Separated by space.
*Note* It is not a array. Must be a string.
