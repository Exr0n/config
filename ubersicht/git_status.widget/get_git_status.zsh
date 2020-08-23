start="$(pwd)"
paths=("$HOME/.config" "$HOME/projects/learn_cpp/problems" "$HOME/Desktop/projects/learn_cpp/problems")

for name ($paths); do
    if [[ -e $name ]]; then
        cd $name
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

