{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/include/gdk/x11

cat << EOF > ${out}/include/gdk/gdkx.h
#pragma once
#define gdk_x11_window_get_type(...) NULL
#define gdk_x11_window_get_xid(...) -1
#define GdkX11Window void
#define gdk_x11_window_foreign_new_for_display(...) NULL
EOF

cat << EOF > ${out}/include/gdk/x11/gdkx.h
#pragma once
#define gdk_x11_window_get_type(...) NULL
#define gdk_x11_window_get_xid(...) -1
#define GdkX11Window void
#define gdk_x11_window_foreign_new_for_display(...) NULL
EOF
{% endblock %}
