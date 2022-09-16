{% extends '//lib/web/kit/t/ix.sh' %}

{% block fetch %}
https://webkitgtk.org/releases/webkitgtk-2.36.6.tar.xz
sha:1193bc821946336776f0dfa5e0dca5651f1e57157eda12da4721d2441f24a61a

#https://webkitgtk.org/releases/webkitgtk-2.38.0.tar.xz
#sha:f9ce6375a3b6e1329b0b609f46921e2627dc7ad6224b37b967ab2ea643bc0fbd
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
lib/xml/2
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

sed -e 's|return false|return true|' \
    -i Source/WebKit/WebProcess/WebPage/libwpe/AcceleratedSurfaceLibWPE.h
{% endblock %}
