start="$(pwd)"
#count=1    # TODO: remove duplicates by getting another one if duped

#for name ($(git_status_paths)) do
for name in $(tail -r -n $1 "/Users/exr0n/.data/recent_git_dirs.csv"); do
    if [[ -d $name ]]; then
        cd $name
        git rev-parse --show-toplevel > /dev/null 2>&1 || continue
        cd "$(git rev-parse --show-toplevel)"
        gstatus="$(git status --porcelain --branch)"
        printf "[\"$(echo $gstatus | head -n 1 | cut -c 4-)\", \"$(pwd)\""
        printf ", $(echo $gstatus | ack -i '^\?\?' | wc -l | xargs)"
        printf ", $(echo $gstatus | ack -i '^.[MARCD]' | wc -l | xargs)"
        printf ", $(echo $gstatus | ack -i '^[MARCD]' | wc -l | xargs)"
        echo "]"
        #count=(( count + 1 ))
        #echo count
    fi
done

cd $start

# ? + circle check

