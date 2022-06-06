{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/J-Lentz/iwgtk/archive/refs/tags/v0.5.tar.gz
sha:5465721f79090d342c389c8748ba6ef679fa83ae5ed23cea90bcb4e1b9017689
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
