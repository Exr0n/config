#!/bin/zsh

source $XDG_CONFIG_HOME/zsh_custom/define_color_codes.zsh

if [[ -z $1 ]]; then
    printf "${COLOR_LightRed}Missing URL Argument!${COLOR_None}\n"
    exit 1;
fi

if [[ -z $2 ]]; then
    SEMANTIC_FILENAME="$(echo $1 | rev | cut -d/ -f1 | rev | sed 's/\./-/')"
    SEMANTIC_SOURCE="$(echo $1 | cut -d/ -f3 | sed 's/\./-/')"
    SEMANTIC_NAME="$(date +'%Y-%m-%d')_${SEMANTIC_SOURCE}_${SEMANTIC_FILENAME}"
    printf "${COLOR_Orange}Missing Name   Argument! Using default ${COLOR_Green}'$SEMANTIC_NAME'${COLOR_None}\n"
else
    SEMANTIC_NAME=$2
fi

if [[ -z $3 ]]; then
    KBPREFIX="$(basename "$(pwd)")"
    printf "${COLOR_Orange}Missing Prefix Argument! Using default ${COLOR_Green}'$KBPREFIX'${COLOR_None}\n"
else
    KBPREFIX=$3
fi

SAVEPATH="papers/${SEMANTIC_NAME}.pdf"
if [[ -e $SAVEPATH ]]; then
    printf "${COLOR_Red}File '${COLOR_Yellow}$SAVEPATH${COLOR_Red}' already ${COLOR_LightRed}exists${COLOR_Red}! Abort.${COLOR_None}\n"
    exit 2
fi

RETRIEVE="$(echo $1 | sed\
    -e 's/arxiv\.org\/abs/arxiv\.org\/pdf/'     \
    )"

printf "Retrieving $COLOR_LightGreen$RETRIEVE$COLOR_None...\n"
wget --user-agent totesFirefox $RETRIEVE -O $SAVEPATH

FLONAME="papers/${KBPREFIX}flo${SEMANTIC_NAME}.org"
echo "| [[file:${SAVEPATH}][${SEMANTIC_NAME}]] | [[file:$FLONAME][flo]] | | |" >> index_of_papers.org

cat << EOF >> $FLONAME
#+TITLE: $SEMANTIC_NAME
#+DATE: $(date +'%d %b %Y')

* overview

* flo

EOF

okular $SAVEPATH &

e $FLONAME

