#!/bin/sh

export PATH=/bin

export XDG_SESSION_ID=$$
export XDG_DATA_DIRS="/ix/realm/${USER}/share"
export XDG_RUNTIME_DIR="${TMPDIR}"
export PS1="pg:home# "
export EDITOR=ted
export TZ=Europe/Moscow
export XCURSOR_SIZE=48
export QT_FONT_DPI=192
export GTK_A11Y=none
export FONTCONFIG_FILE=/ix/realm/pg/etc/fonts/fonts.conf

exec niri-session
