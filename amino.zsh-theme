# amino.zsh-theme
# Oh My Zsh theme converted from Oh My Posh amino configuration

# Enable git info in prompts
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# Git format configuration
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '●'
zstyle ':vcs_info:git:*' unstagedstr '○'
zstyle ':vcs_info:git:*' formats ' %F{black}%K{#29f366}  %b%u%c %k%f'
zstyle ':vcs_info:git:*' actionformats ' %F{black}%K{yellow}  %b|%a%u%c %k%f'
zstyle ':vcs_info:*' enable git

# Terminal title - shows folder, root status, and shell
function set_terminal_title() {
    local folder="${PWD##*/}"
    local root_indicator=""
    if [[ $UID -eq 0 ]]; then
        root_indicator=" :: root"
    fi
    print -Pn "\e]0;${folder}${root_indicator} :: zsh\a"
}
precmd_functions+=( set_terminal_title )

# Root indicator function
function root_indicator() {
    if [[ $UID -eq 0 ]]; then
        echo -n "%F{#41ff87} %f"
    fi
}

# Left prompt: root indicator + arrow
PROMPT='$(root_indicator)%F{#29f366}  %f'

# Right prompt: path + git info
RPROMPT='%F{#29f381} %~ %f${vcs_info_msg_0_}'
