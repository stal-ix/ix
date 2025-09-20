#!/bin/sh

export PATH=/bin

export XDG_SESSION_ID=$$
export XDG_DATA_DIRS="/ix/realm/${USER}/share"
export XDG_RUNTIME_DIR="${TMPDIR}"
export XCURSOR_SIZE=48
export QT_FONT_DPI=192
export GTK_A11Y=none

exec niri-session
