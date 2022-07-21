{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/J-Lentz/iwgtk/archive/refs/tags/v0.7.tar.gz
sha:ab33211e8e65e723bfe9ac3276dd2fcaec50a6fffe06c44d21615e612755e744
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gtk/4
lib/rsvg/dl
lib/qrencode
{% endblock %}

{% block bld_tool %}
bin/gzip
bld/pkg/config
{% endblock %}

{% block make_flags %}
confdir=${out}/share
{% endblock %}

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('iwgtk')}}
{% endblock %}
