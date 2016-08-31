#Mac向け設定
if [ `uname` = "Darwin" ]; then
    alias sed='gsed'
    alias awk='gawk'
    alias grep='ggrep'
    alias find='gfind'
    alias xargs='gxargs'


    export PATH="/usr/local/opt/ruby/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    export MANPATH="/usr/local/share/man:/usr/local/opt/coreutils/share/man:${MANPATH}"

    #brewからの指示により、オンラインヘルプを使うため
    unalias run-help
    autoload run-help
    HELPDIR=/usr/local/share/zsh/helpfiles
    export INCLUDE="/usr/local/Cellar/libelf/0.8.13/include/libelf:~/include"

fi

export LANG='ja_JP.UTF-8'
# export COLORTERM='rxvt'
# export TERM='xterm-256color'

export LS_COLORS='rs=0:di=00;44:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:*.txt=00;32:*.rb=00;31:*.org=00;33:*.php=01;35';

xset r rate 225 50

alias ls='ls --color'
alias ll='ls -lah'
alias killcaps='setxkbmap -option ctrl:nocaps'
alias open='xdg-open'
alias c++='c++ -rdynamic'
alias cc='cc -rdynamic'
alias g++='g++ -rdynamic -Wall -pedantic -ansi -Wshadow -O2 -std=c++11'
alias gcc='gcc -rdynamic -Wall -pedantic -ansi -Wshadow -O2'
alias x86_64-pc-linux-gnu-c++='x86_64-pc-linux-gnu-c++ -rdynamic'
alias x86_64-pc-linux-gnu-g++='x86_64-pc-linux-gnu-g++ -rdynamic'
alias x86_64-pc-linux-gnu-gcc='x86_64-pc-linux-gnu-gcc -rdynamic'
alias projector='xrandr --output LVDS1 --mode 1600x900 --output VGA1 --mode 1024x768 --right-of LVDS1'
alias escale='xrandr --fb 1920x1080 --output LVDS1 --scale 1.2x1.2 --mode 1600x900 --panning 1920x1080'
alias oscale='xrandr --fb 1600x900 --output LVDS1 --scale 1x1 --mode 1600x900  --panning 1600x900'
alias off='xrandr --output VGA1 --off'
alias grep='grep --color'
alias ec='emacsclient -nw'
alias clang++='clang++ -O2 -std=c++11'
alias clang='clang -O2'


#プロンプト設定 %(,,)はif...then...else、?は直前の終了ステータス、!はユーザーの権限のチェック
local p_info="[ %n@%m ]"
local p_mark="%(?,%F{green},%F{red})%(!,#,$)%f"
if [ $SSH_CLIENT ]; then
    PROMPT="%K{cyan}$p_info%k"
    if [ `whoami` = "root" ]; then
        PROMPT="%F{red}${PROMPT}%f $p_mark "
    else
        PROMPT="%F{black}${PROMPT}%f $p_mark "
    fi
else
    PROMPT="$p_info $p_mark "
fi





#以下シェル関連の設定


#export PROMPT=''
RPROMPT="[%/ %T]"
export PATH=/usr/lib/ccache/bin:${PATH}:~/local/bin
export _JAVA_AWT_WM_NONREPARENTING=0
export EDITOR=emacs
export LANG=ja_JP.UTF-8
export KCODE=u
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000


bindkey -e

setopt no_beep
setopt auto_cd
setopt correct
setopt magic_equal_subst
setopt prompt_subst
setopt notify
setopt nonomatch
setopt share_history
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

autoload colors

#補完
autoload -U compinit; compinit #補完を有効化
setopt auto_list #補完候補を一覧表示
setopt auto_menu #補完キー連打で候補を表示
setopt list_packed #詰めて表示
setopt list_types #ファイルの種類も一緒に表示
bindkey "^[Z" reverse-menu-complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
zstyle ':completion:*' verbose yes
zstyle ':completion:*:default' menu select

# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

# $TMUXが定義されていないならアタッチするかセッションを開始
if [ $(id -u) != 0 ]; then
    if [ ! $TMUX ]; then
        if $(tmux has-session 2> /dev/null); then
            tmux attach
        else
            if [ $SSH_CLIENT ]; then
                tmux -f ~/.tmux.conf.server
            else
                tmux -f ~/.tmux.conf.terminal
            fi
        fi
    fi
fi


function new_tmux() {
    if $(tmux has-session 2> /dev/null); then
        tmux attach
    else
        if [ -z ${SSH_CLIENT} ]; then
            tmux -f ~/.tmux.conf.terminal
        else
            tmux -f ~/.tmux.conf.server
        fi
    fi
}

