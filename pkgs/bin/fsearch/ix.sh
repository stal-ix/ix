{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/cboxdoerfer/fsearch/archive/refs/tags/0.2.tar.gz
sha:96d1eac47fec8eb4e76a4fb8dfbc0b45365569a62c6f0e91d69b8a5e2ca1eaea
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
bld/gettext
bld/glib/codegen
{% endblock %}

{% block patch %}
find . -type f -name '*.c' | while read l; do
    sed -e 's|malloc_trim.*||' -i ${l}
done
{% endblock %}

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('fsearch')}}
{% endblock %}
