# SYNOPSIS

Outthentic plugin.

Since there is no official installer for Archlinux.

# INSTALL

    $ sparrow plg install archlinux-install

# USAGE

## via sparrow task    
    $ sparrow project create archlinux
    $ sparrow task add archlinux install archlinux-install

Add configuration in your config file (yaml, json or Config::General):

    $ sparrow task ini archlinux/install

    lvm:
      vg: vg_main
      lv: slashroot
    grub:
      install: true
      type: efi
      target: /dev/sda
      partition: /dev/sda2

    $ sparrow task run archlinux/install

## via sparrowdo

    $ cat sparrowfile
    task-run "Install Archlinux", "archlinux-install", %(
      lvm   => %(
        vg   => 'vg_main',
        lv   => 'slashroot'
      ),
      grub  => %(
        install => 'true',
        type    => 'efi',
        target  => '/dev/sda',
        partition => '/dev/sda2',
        debug   => '1',
      )
    );


# Parameters

## lvm part
### vg
Your volume group. It must be already created.

### lv
Your logical volume. It must be already created.

## grub part
### install
One of two: (true|false). Default is `false`.

### type
Supported type: efi.

### target
Your phisical disk for install grub.

### partition
Your desired partition for install grub. For efi must be ESP type.
No need for BIOS installation.
