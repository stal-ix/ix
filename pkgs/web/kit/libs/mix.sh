{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/atk
lib/icu
lib/c++
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
lib/gtk/4
lib/gcrypt
lib/soup/3
lib/wayland
lib/sqlite3
lib/seccomp
lib/freetype
lib/harfbuzz
lib/jpeg/open
lib/fontconfig
lib/glib/networking/register

# drivers
lib/mesa/gl
lib/mesa/egl
lib/mesa/drivers/gl/zink
lib/mesa/drivers/vulkan
{% endblock %}
