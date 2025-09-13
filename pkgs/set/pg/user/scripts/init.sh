#!/bin/sh

export PATH=/bin

export XDG_SESSION_ID=$$
export XDG_DATA_DIRS="/ix/realm/${USER}/share"
export XDG_RUNTIME_DIR="${TMPDIR}"

exec niri-session
