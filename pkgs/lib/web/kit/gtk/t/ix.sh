{% extends '//lib/web/kit/t/ix.sh' %}

{% block fetch %}
https://webkitgtk.org/releases/webkitgtk-2.38.1.tar.xz
sha:02e195b3fb9e057743b3364ee7f1eec13f71614226849544c07c32a73b8f1848
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

base64 -d << EOF > Source/WebKit/Platform/IPC/ArgumentCoders.h
{% include 'ArgumentCoders.h/base64' %}
EOF
{% endblock %}
