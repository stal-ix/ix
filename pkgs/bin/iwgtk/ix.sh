{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/J-Lentz/iwgtk/archive/refs/tags/v0.6.tar.gz
sha:43e128c1ef123d115cda34a66f9a79b63560e0e7b658a6f34c60ddeb3a740704
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gtk/4
lib/rsvg/dl
{% endblock %}

{% block bld_tool %}
bin/gzip
bld/pkg/config
{% endblock %}

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('iwgtk')}}
{% endblock %}
