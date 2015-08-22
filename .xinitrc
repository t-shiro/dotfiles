#IM Setting
export LANG="ja_JP.UTF-8"
export DefaultIMModule=ibus
export XMODIFIER="@im=ibus"
export XMODIFIERS="@im=ibus"
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"

export BROWSER="google-chrome-stable"

# xfce4-power-manager
ibus-daemon -d -x
killall xbindkeys
/opt/bin/dropbox &
# wpa_gui &
xbindkeys
alias open='xdg-open'
setxkbmap -option ctrl:nocaps
# xrandr --fb 1600x900 --output LVDS1 --scale 1.171x1.171 --mode 1366x768 --panning 1600x900
 xbacklight -set 95
# xgamma -rgamma 0.7 -ggamma 0.7 -bgamma 0.5


exec awesome
#xcompmgr &
# skype &
# exec awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
xset r rate 250 40
feh --bg-fill ~/Dropbox/fullhd.jpg
