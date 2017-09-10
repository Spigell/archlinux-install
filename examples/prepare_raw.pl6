my $disk = '/dev/sda';
 
bash "parted $disk mklabel gpt";
bash "parted $disk mkpart P1 2Mib 9Gib";
bash "parted $disk mkpart ESP fat32 9Gib 9513Mib";
bash "parted $disk set 2 boot on";
