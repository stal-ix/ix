{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/cboxdoerfer/fsearch/archive/refs/tags/0.1.3.tar.gz
sha:b29ca3f49f2847f280320e0b346a5e6ec98e76e3523c78dbd8178a8f8f19b5dc
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
