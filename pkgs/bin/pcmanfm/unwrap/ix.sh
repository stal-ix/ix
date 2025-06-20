{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
pcmanfm
{% endblock %}

{% block version %}
1.3.2
{% endblock %}

{% block fetch %}
https://github.com/lxde/pcmanfm/archive/refs/tags/{{self.version().strip()}}.tar.gz
66ee6b1a5907bb519d5b175e379f975acfcdaa68b6cbbc72d168b3ff935e6fea
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
