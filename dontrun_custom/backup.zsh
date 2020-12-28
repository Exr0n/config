
SOURCE=/
SIZE="$(sudo du -sk $SOURCE | cut -f 1)"
echo "total size: $SIZE"
sudo tar --exclude-from=/home/exr0n/.config/dontrun_custom/backup_ignores.txt --acls --xattrs -I pbzip2 -cvpf $SOURCE | pv -p -s ${SIZE}k | sudo bzip2 -c > "/home/exr0n/vol/backup/arch-full-$(date '+%F').tar.bz2"

