export PATH=/usr/local/opt/ruby/bin:/usr/local/bin:/usr/local/sbin:${PATH}
alias sed='gsed'
alias awk='gawk'
alias grep='ggrep'

#brewからの指示により、オンラインヘルプを使うため
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

export EDITOR=emacs
export LANG=ja_JP.UTF-8
export KCODE=u

bindkey -e

setopt no_beep
setopt auto_cd
setopt correct
setopt magic_equal_subst
setopt prompt_subst
setopt notify

#補完
autoload -U compinit; compinit #補完を有効化
setopt auto_list #補完候補を一覧表示
setopt auto_menu #補完キー連打で候補を表示
setopt list_packed #詰めて表示
setopt list_types #ファイルの種類も一緒に表示
bindkey "^[Z" reverse-menu-complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
zstyle ':completion:*' verbose yes

# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true
