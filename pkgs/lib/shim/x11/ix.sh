{% extends '//die/c/ix.sh' %}

{% block unpack %}
: nothing to unpack
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build %}
cc -c -o empty.o -x c - << EOF
EOF

ar q libempty.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib ${out}/include

cp libempty.a ${out}/lib/libX11.a
cp libempty.a ${out}/lib/libxcb.a

mkdir ${out}/include/X11

cat << EOF > ${out}/include/X11/Xlib.h
#pragma once
typedef void* Display;
typedef void* Window;
#define XResetScreenSaver(X)
#define XKeysymToString(X) ""
#define XOpenDisplay(X) NULL
#define DefaultScreen(X) 0
#define DisplayWidth(X, Y) 0
#define DisplayHeight(X, Y) 0
EOF

cat << EOF > ${out}/include/X11/Xutil.h
#pragma once
#include <X11/Xlib.h>
EOF

cat << EOF > ${out}/include/X11/keysym.h
#pragma once
#include <X11/Xlib.h>
EOF

mkdir ${out}/include/xcb

cat << EOF > ${out}/include/xcb/xcb.h
#pragma once

#include <time.h>

typedef struct {
        int x;
} xcb_connection_t;

#define xcb_connect(x, y) NULL
#define xcb_connection_has_error(x) 0
#define xcb_disconnect(x)
EOF
{% endblock %}
