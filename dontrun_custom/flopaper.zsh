#!/bin/zsh

source $XDG_CONFIG_HOME/zsh_custom/define_color_codes.zsh

if [[ -z $2 ]]; then 
    [[ -d papers ]] && NOTES_DIR="papers"

    if [[ -n $NOTES_DIR ]]; then
        printf "${COLOR_Orange}Missing directory path! Using default ${COLOR_Green}$NOTES_DIR/${COLOR_None}\n"
    else 
        printf "${COLOR_LightRed}Could not find notes directory!"
    fi
else
    NOTES_DIR=$2
fi

if [[ -z $1 ]]; then
    SEMANTIC_NAME="$(ls $NOTES_DIR/*.pdf | xargs -l1 basename | cut -d. -f 1 | fzf)"
else
    SEMANTIC_NAME=$1
fi

okular "$NOTES_DIR/$SEMANTIC_NAME.pdf" &

EXPECTED_FLO_PATH="$(basename $(pwd))flo$SEMANTIC_NAME.org" 
if [[ ! -e "$NOTES_DIR/$EXPECTED_FLO_PATH" ]]; then 
    EXPECTED_FLO_PATH="$(ls $NOTES_DIR/*.org | xargs -l1 basename | fzf)"
fi
e "$NOTES_DIR/$EXPECTED_FLO_PATH"
