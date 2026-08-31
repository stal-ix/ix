{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
pcmanfm
{% endblock %}

{% block version %}
1.4.0
{% endblock %}

{% block fetch %}
https://github.com/lxde/pcmanfm/archive/refs/tags/{{self.version().strip()}}.tar.gz
cda4f5ad7e049dcdf3b051b9de4c779adcd55bd720e9c96c45275389aa84264e
{% endblock %}

{% block bld_libs %}
lib/c
lib/fm
lib/glib
lib/gtk/3
lib/gtk/deps
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/intltool
{% endblock %}

{% block configure_flags %}
--with-gtk=3
{% endblock %}

{% block patch %}
sed -e 's|.*XLIB.*||' -i configure.ac

base64 -d << EOF > src/pcmanfm.c
{% include 'pcmanfm.c/base64' %}
EOF

cat << EOF > src/desktop.c
#include <stdlib.h>

void* fm_desktop_get(int screen, int monitor) {
    return NULL;
}

void fm_desktop_manager_init(int on_screen) {
}

void fm_desktop_manager_finalize() {
}

void fm_desktop_preference(void* act, void* desktop) {
}

void fm_desktop_wallpaper_changed(void* desktop) {
}

void* fm_desktop_get_type() {
    abort();

    return NULL;
}
EOF
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
