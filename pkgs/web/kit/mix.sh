{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://webkitgtk.org/releases/webkitgtk-2.34.3.tar.xz
de30c41fb57b2b024417669c22914752
{% endblock %}

{% block lib_deps %}
web/kit/libs(harfbuzz_icu=1)
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
USE_GTK4=ON
USE_WPE_RENDERER=OFF

ENABLE_GAMEPAD=OFF
ENABLE_INTROSPECTION=OFF
USE_SYSTEMD=OFF

USE_LIBSECRET=OFF
ENABLE_SPELLCHECK=OFF
USE_LIBNOTIFY=OFF
USE_LIBHYPHEN=OFF
ENABLE_THUNDER=OFF
ENABLE_BUBBLEWRAP_SANDBOX=OFF
ENABLE_VIDEO=OFF
ENABLE_WEB_AUDIO=OFF

ENABLE_X11_TARGET=OFF
ENABLE_WAYLAND_TARGET=ON

#USE_LIBEPOXY=OFF
#ENABLE_WEBGL=OFF
#USE_ANGLE_EGL=OFF
#USE_ANGLE_WEBGL=OFF
#USE_ANGLE=OFF
#ENABLE_GLES2=OFF
#USE_OPENGL_OR_ES=OFF

ENABLE_MINIBROWSER=ON
{% endblock %}

{% block c_rename_symbol %}
_caches
_xdg_binary_or_text_fallback
{% endblock %}

{% block setup %}
export CPPFLAGS=$(echo ${CPPFLAGS} | tr ' ' '\n' | grep -v mesa | tr '\n' ' ')
export CPPFLAGS="-w -DWL_EGL_PLATFORM=1 -DEGL_NO_X11=1 -Wno-register ${CPPFLAGS}"
{% endblock %}

{% block patch %}
find . | grep CMake | while read l; do
    sed -e 's| SHARED| STATIC|' -i ${l}
    sed -e 's| MODULE| STATIC|' -i ${l}
done

find . | grep '\.cmake' | while read l; do
    sed -e 's| SHARED| STATIC|' -i ${l}
    sed -e 's| MODULE| STATIC|' -i ${l}
done

(
    cd Source/WebCore/platform/graphics/egl

    cat GLContextEGL.cpp \
        | grep -v eglCreateWindowSurface \
        > _ && mv _ GLContextEGL.cpp
)

(
    cd Source/WebKit/UIProcess/gtk

    sed -e 's|GRefPtr.h>|GRefPtr.h>\n#include <wtf/glib/GUniquePtr.h>|' \
        -i ClipboardGtk4.cpp
)
{% endblock %}

{% block setup_tools %}
C=$(which clang++)

cat << EOF > clang++
#!$(which python3)

import sys
import subprocess

if '-P' in sys.argv or '-E' in sys.argv in tst:
    arg0 = 'clang-cpp'
else:
    arg0 = "${C}"

subprocess.check_call([arg0] + sys.argv[1:])
EOF

chmod +x clang++
{% endblock %}

{% block install %}
{{super()}}
exit 1
{% endblock %}
