
SOURCE='/home'
SIZE="$(sudo du -sk $SOURCE --exclude=/proc --exclude=/run --exclude=/tmp | cut -f 1)"
TARGET="/home/exr0n/vol/backup/$hostname-home-$(date '+%F')"
echo "total size: $SIZE"
echo backing up $SOURCE

# multithread attempt
#sudo tar --exclude-from=/home/exr0n/.config/dontrun_custom/backup_ignores.txt --acls --xattrs -I pbzip2 -cpf - $SOURCE |\
#    #pv -p -s "${SIZE}k" |\
#    pv -s ${SIZE}k |\
#    sudo bzip2 -c > "/home/exr0n/vol/backup/arch-full-$(date '+%F').tar.bz2"

tar --exclude-from='/home/exr0n/.config/dontrun_custom/backup_ignores.txt' --acls --xattrs -cpf - "${SOURCE}" | pv -s "${SIZE}k" | xz -9 --threads=20 -c > "$TARGET"

# good old silent tar
#sudo tar --exclude-from=/home/exr0n/.config/dontrun_custom/backup_ignores.txt --acls --xattrs --totals=SIGUSR1 -I pbzip2 -cpf "/home/exr0n/vol/backup/arch-full-$(date '+%F')" $SOURCE

