{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/cboxdoerfer/fsearch/archive/refs/tags/0.1.4.tar.gz
sha:289c19136f89712100ff8f6ad4e7cbbdfbd2938a7c076c85c45658f5c36fc7fd
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
