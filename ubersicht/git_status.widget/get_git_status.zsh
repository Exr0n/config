#!/usr/local/bin/zsh

start="$(pwd)"
paths=("$HOME/.config" "$HOME/projects/learn_cpp/problems" "$HOME/Desktop/projects/learn_cpp/problems")

for name ($paths); do
    if [[ -e $name ]]; then
        cd $name
        cd "$(git rev-parse --show-toplevel)"
        printf "[\"$(pwd)\""
        #echo "$(git status -s | ack -i '^.[MARCD]')"
        gstatus="$(git status -s)"
        printf ", $(echo $gstatus | ack -i '^\?\?' | wc -l | xargs)"
        printf ", $(echo $gstatus | ack -i '^.[MARCD]' | wc -l | xargs)"
        printf ", $(echo $gstatus | ack -i '^[MARCD]' | wc -l | xargs)"
        echo "]"
    fi
done

cd $start

# ? + circle check

