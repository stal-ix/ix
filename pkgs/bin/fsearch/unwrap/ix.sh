{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
fsearch
{% endblock %}

{% block version %}
0.3.2
{% endblock %}

{% block fetch %}
https://github.com/cboxdoerfer/fsearch/archive/refs/tags/{{self.version().strip()}}.tar.gz
2c9bc7de9ac1ba72232cb4d66a750fe04210fdae96273f04316b6616fc098308
{% endblock %}

{% block bld_libs %}
lib/c
lib/icu
lib/glib
lib/intl
lib/gtk/3
lib/pcre/2
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
{% endblock %}

{% block patch %}
sed -e '/subdir.*help/d' -i meson.build

find . -type f -name '*.c' | while read l; do
    sed -e 's|#include <linux/fanotify.h>||' \
        -e 's|<linux/limits.h>|<limits.h>|' \
        -e 's|malloc_trim.*||' -i ${l}
done
{% endblock %}
