#!/ix/realm/pg/bin/bash

export PATH=/ix/realm/pg/bin:/bin

export IM_SCALE=2.5
export XDG_SESSION_ID=$$
export XDG_DATA_DIRS="/ix/realm/${USER}/share"
export XDG_RUNTIME_DIR="${TMPDIR}"
export XCURSOR_SIZE=48
export QT_FONT_DPI=192
export GTK_A11Y=none
export ZUTTY_FONT_SIZE=32
export SHITTY_FONT_SIZE=32

eval $(ssh-agent)

ssh-add ~/.ssh/*

impulse-session --mode "${1:-3840x2160@120}" --scale 2.5 --hdr 300 "${@:2}" >& ~/slog
