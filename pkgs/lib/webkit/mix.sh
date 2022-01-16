{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://webkitgtk.org/releases/webkitgtk-2.34.3.tar.xz
de30c41fb57b2b024417669c22914752
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/atk
lib/icu
lib/c++
lib/gtk
lib/png
lib/avif
lib/webp
lib/xml2
lib/glib
lib/jpeg
lib/xslt
lib/tasn1
lib/cairo
lib/pango
lib/lcms2
lib/epoxy
lib/woff2
lib/gcrypt
lib/secret
lib/soup/3
lib/wayland
lib/sqlite3
lib/seccomp
lib/freetype
lib/harfbuzz
lib/jpeg/open
lib/fontconfig
lib/harfbuzz/icu
lib/gstreamer/19/dl
{% endblock %}

{% block bld_libs %}
lib/webkit/drivers
{% endblock %}

{% block bld_tool %}
lib/glib
gnu/gettext
dev/tool/perl
dev/tool/ruby
dev/tool/gperf
dev/tool/python
lib/wayland/protocols
{% endblock %}

{% block cmake_flags %}
PORT=GTK
USE_WPE_RENDERER=OFF

USE_SYSTEMD=OFF
ENABLE_GAMEPAD=OFF
ENABLE_INTROSPECTION=OFF

USE_LIBNOTIFY=OFF
USE_LIBHYPHEN=OFF

ENABLE_THUNDER=OFF
ENABLE_SPELLCHECK=OFF
ENABLE_BUBBLEWRAP_SANDBOX=OFF

ENABLE_X11_TARGET=OFF
ENABLE_WAYLAND_TARGET=ON
{% endblock %}

{% block c_rename_symbol %}
_caches
_xdg_binary_or_text_fallback
{% endblock %}

{% block cpp_defines %}
WL_EGL_PLATFORM=1
EGL_NO_X11=1
{% endblock %}

{% block setup %}
export CPPFLAGS=$(echo ${CPPFLAGS} | tr ' ' '\n' | grep -v mesa | tr '\n' ' ')
export CPPFLAGS="-w -Wno-register ${CPPFLAGS}"
{% endblock %}

{% block patch %}
(find . | grep CMake; find . | grep '\.cmake') | while read l; do
    sed -e 's| SHARED| STATIC|' \
        -e 's| MODULE| STATIC|' \
        -i ${l}
done

(
    cd Source/WebCore/platform/graphics/egl

    cat GLContextEGL.cpp \
        | grep -v eglCreateWindowSurface \
        > _ && mv _ GLContextEGL.cpp
)

sed -e 's|GRefPtr.h>|GRefPtr.h>\n#include <wtf/glib/GUniquePtr.h>|' \
    -i Source/WebKit/UIProcess/gtk/ClipboardGtk4.cpp

base64 -d << EOF > Source/WebKit/WebProcess/InjectedBundle/glib/InjectedBundleGlib.cpp
{% include 'InjectedBundleGlib.cpp/base64' %}
EOF

sed -e 's|ENABLE(DEVELOPER_MODE)|1|g' \
    -i Source/WebKit/Shared/glib/ProcessExecutablePathGLib.cpp
{% endblock %}

{% block setup_tools %}
C=$(which clang++)

cat << EOF > clang++
#!$(which python3)

import sys
import subprocess

if '-P' in sys.argv or '-E' in sys.argv:
    arg0 = 'clang-cpp'
else:
    arg0 = "${C}"

subprocess.check_call([arg0] + sys.argv[1:])
EOF

chmod +x clang++
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/lib

find ${tmp}/obj -type f | grep '\.a' | while read l; do
    cp ${l} ./
done
{% endblock %}

{% block postinstall %}
echo 'TODO(pg): figure proper layout for webkit"s libexec'
{% endblock %}
