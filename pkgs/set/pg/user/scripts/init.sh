#!/ix/realm/pg/bin/bash

export PATH=/home/pg/monorepo/imway:/ix/realm/pg/bin:/bin

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

imway-session --mode 3840x2160@120 --scale 2.5 --hdr 300 >& ~/slog
