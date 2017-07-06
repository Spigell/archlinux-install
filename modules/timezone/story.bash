debug=$(config debug)
[[ $debug ]] && set -x

timezone=$(config system.timezone)

if [[ `find /mnt/usr/share/zoneinfo/$timezone` ]]; then 
  tz_exists=yes
else
  echo "Your timezone ( $timezone ) is unknown. Please check it."
  exit 10
fi

echo "Setting timezone..."
ln -sf /mnt/usr/share/zoneinfo/$timezone /mnt/etc/localtime
