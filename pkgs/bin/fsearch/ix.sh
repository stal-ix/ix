{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/cboxdoerfer/fsearch/archive/refs/tags/0.2.2.tar.gz
sha:c98d73000436c7182a86c33298f7390c82bce7854b824c80978acc080d979445
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
