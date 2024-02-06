{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/cboxdoerfer/fsearch/archive/refs/tags/0.2.3.tar.gz
sha:b3c576bf1230da7c374d00bb32d72686b940b4dee80d941495acfdd5437bf117
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
find . -type f -name '*.c' | while read l; do
    sed -e 's|malloc_trim.*||' -i ${l}
done
{% endblock %}
