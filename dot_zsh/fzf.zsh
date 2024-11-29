export FZF_DEFAULT_OPTS = "--height 40% --border --reverse "

function ghq-fzf_change_directory() {
  local src=$(ghq list | fzf --preview "eza -l -g -a --icons $(ghq root)/{} | tail -n+4 | awk '{print \$6\"/\"\$8\" \"\$9 \" \" \$10}'")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}

function history-fzf() {
    local src=$(history | fzf --tac --preview "echo {} | awk '{print \$2}' | xargs -I % sh -c 'echo %; history | grep %'")
    if [ -n "$src" ]; then
        BUFFER="fc -s $src"
        zle accept-line
    fi
    zle -R -c
}

zle -N ghq-fzf_change_directory
bindkey '^g' ghq-fzf_change_directory
bindkey '^r' history-fzf

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' use-fzf-default-opts yes
