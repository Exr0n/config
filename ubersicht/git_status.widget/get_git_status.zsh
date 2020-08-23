start="$(pwd)"
GIT_STATUS_PATHS=("$HOME/.config" "$HOME/projects/learn_cpp/" "$HOME/projects")

for name ($GIT_STATUS_PATHS) do
    if [[ -e $name ]]; then
        cd $name
        git rev-parse --show-toplevel > /dev/null 2>&1 || break
        cd "$(git rev-parse --show-toplevel)"
        gstatus="$(git status --porcelain --branch)"
        printf "[\"$(echo $gstatus | head -n 1 | cut -c 4-)\", \"$(pwd)\""
        printf ", $(echo $gstatus | ack -i '^\?\?' | wc -l | xargs)"
        printf ", $(echo $gstatus | ack -i '^.[MARCD]' | wc -l | xargs)"
        printf ", $(echo $gstatus | ack -i '^[MARCD]' | wc -l | xargs)"
        echo "]"
    fi
done

cd $start

# ? + circle check

