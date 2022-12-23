{% extends '//lib/web/kit/t/ix.sh' %}

{% block fetch %}
https://webkitgtk.org/releases/webkitgtk-2.38.3.tar.xz
sha:41f001d1ed448c6936b394a9f20e4640eebf83a7f08262df28504f7410604a5a
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/wpe
lib/atk
lib/icu
lib/c++
lib/gtk
lib/png
lib/jxl
lib/avif
lib/webp
lib/glib
lib/jpeg
lib/xslt
lib/tasn1
lib/cairo
lib/pango
lib/epoxy
lib/woff2
lib/xml/2
lib/gcrypt
lib/secret
lib/soup/3
lib/lcms/2
lib/notify
lib/wayland
lib/seccomp
lib/sqlite/3
lib/freetype
lib/harfbuzz
lib/jpeg/open
lib/gstreamer
lib/fontconfig
lib/harfbuzz/icu
{% endblock %}

{% block cmake_flags %}
{{super()}}
ENABLE_GLES2_DEFAULT=ON
USE_WPE_RENDERER=ON
ENABLE_GLES2=ON
USE_OPENGL=OFF
PORT=GTK
USE_JPEGXL=ON
{% endblock %}

{% block patch %}
{{super()}}

sed -e 's|static_cast<EGLNativeWindowType>|(EGLNativeWindowType)|' \
    -i Source/WebCore/platform/graphics/egl/GLContextEGL.cpp

sed -e 's|GRefPtr.h>|GRefPtr.h>\n#include <wtf/glib/GUniquePtr.h>|' \
    -i Source/WebKit/UIProcess/gtk/ClipboardGtk4.cpp

base64 -d << EOF > Source/WebKit/Platform/IPC/ArgumentCoders.h
{% include 'ArgumentCoders.h/base64' %}
EOF
{% endblock %}
