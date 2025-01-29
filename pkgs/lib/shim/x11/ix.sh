{% extends '//die/gen.sh' %}

{% block lib_deps %}
lib/c
lib/shim/fake(lib_name=X11)
lib/shim/fake(lib_name=xcb)
lib/shim/fake/pkg(pkg_name=xcursor,pkg_ver=100500)
{% endblock %}

{% block install %}
mkdir -p ${out}/include/X11/Xcursor

cat << EOF > ${out}/include/X11/Xcursor/Xcursor.h
#pragma once

struct XImage {
    int width;
    int height;
    int xhot;
    int yhot;
    void* pixels;
    int delay;
};

struct XcursorImages {
    size_t nimage;
    XImage** images;
};

static inline const char* XcursorLibraryPath() {
    return nullptr;
}

static XcursorImages* XcursorShapeLoadImages(int, const char*, size_t) {
    return nullptr;
}

static XcursorImages* XcursorFileLoadImages(FILE*, size_t) {
    return nullptr;
}

static void XcursorImagesDestroy(XcursorImages*) {
}
EOF

cat << EOF > ${out}/include/X11/Xlib.h
#pragma once
typedef void* Display;
typedef void* Window;
typedef void* Pixmap;
#define XResetScreenSaver(X)
#define XKeysymToString(X) ""
#define XOpenDisplay(X) NULL
#define DefaultScreen(X) 0
#define DisplayWidth(X, Y) 0
#define DisplayHeight(X, Y) 0
EOF

cat << EOF > ${out}/include/X11/Xatom.h
#pragma once
#include <X11/Xlib.h>
EOF

cat << EOF > ${out}/include/X11/Xregion.h
#pragma once
#include <X11/Xlib.h>
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

cat << EOF > ${out}/include/xcb/xcb_icccm.h
#pragma once
EOF

cat << EOF > ${out}/include/xcb/res.h
#pragma once
EOF

cat << EOF > ${out}/include/X11/Xauth.h
#pragma once
struct Xauth {
    int family;
    const char* address;
    int address_length;
    const char* number;
    int number_length;
    const char* name;
    int name_length;
    const char* data;
    int data_length;

};
#define FamilyLocal 0
#define FamilyWild 0
#define XauWriteAuth(...) 1
EOF

mkdir ${out}/include/gdk

cat << EOF > ${out}/include/gdk/gdkx.h
#pragma once
EOF
{% endblock %}
