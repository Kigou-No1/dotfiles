HISTFILE=~/.zsh/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt append_history
setopt share_history
setopt hist_ignore_all_dups

setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
export HSTR_TIOCSTI=y

. "$HOME/.cargo/env" # load cargo
export EDITOR='code-insiders'
export GPG_TTY=$(tty)

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/home/hadzuki/.bun/_bun" ] && source "/home/hadzuki/.bun/_bun"

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補を一覧表示したとき、Tabや矢印で選択できるようにする
zstyle ':completion:*:default' menu select=1
autoload -U compinit; compinit