# NOTE: This is outdated! see p10k.zsh
# Set prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time status root_indicator background_jobs vcs)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

# Colors!
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='012'
POWERLEVEL9K_DIR_HOME_BACKGROUND='002'
POWERLEVEL9K_DIR_NOT_WRITEABLE_BACKGROUND='001'

POWERLEVEL9K_TIME_BACKGROUND='232'
POWERLEVEL9K_TIME_FOREGROUND='242'

alias verbose_prompt='source $ZSH_CUSTOM/../dontrun_custom/verbose_powerlevel9k_config.zsh'