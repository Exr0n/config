#!/bin/zsh

# automated login: https://superuser.com/questions/189376/ssh-copy-id-does-not-work

# rsync -HaxP --numeric-ids --delete -e "ssh -T -c arcfour -o Compression=no -o 'IPQoS throughput' -x" user@<source>:<source_dir> <dest_dir>

filenames=( etc root srv usr var )

for file in "${filenames[@]}"; do
    tmux split-pane "echo $file; sleep 2"
    tmux select-layout even-vertical
done

echo done

