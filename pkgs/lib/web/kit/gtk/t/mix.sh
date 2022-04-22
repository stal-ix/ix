{% extends '//lib/web/kit/t/mix.sh' %}

{% block fetch %}
https://webkitgtk.org/releases/webkitgtk-2.36.1.tar.xz
sha:0149ea5fb1d20f2a9981677d45c952a047330001ea24a8dc29035239f12c0c8f
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
{% endblock %}

{% block patch %}
{{super()}}

sed -e 's|.*eglCreateWindowSurface.*||' \
    -i Source/WebCore/platform/graphics/egl/GLContextEGL.cpp

sed -e 's|GRefPtr.h>|GRefPtr.h>\n#include <wtf/glib/GUniquePtr.h>|' \
    -i Source/WebKit/UIProcess/gtk/ClipboardGtk4.cpp

sed -e 's|return false|return true|' \
    -i Source/WebKit/WebProcess/WebPage/libwpe/AcceleratedSurfaceLibWPE.h
{% endblock %}
