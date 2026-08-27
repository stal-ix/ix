{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
fsearch
{% endblock %}

{% block version %}
0.3.1
{% endblock %}

{% block fetch %}
https://github.com/cboxdoerfer/fsearch/archive/refs/tags/{{self.version().strip()}}.tar.gz
b16ab75556d841bf858633710d71c92f35d34362614b8584b0a5b71690a72c39
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
