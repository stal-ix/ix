{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/J-Lentz/iwgtk/archive/refs/tags/v0.8.tar.gz
sha:38e81e67004bbd246b6551ffc812b6ab019f84a7329f134bb8031eb61d9d732c
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
bin/scdoc
bld/pkg/config
{% endblock %}

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('iwgtk')}}
{% endblock %}
