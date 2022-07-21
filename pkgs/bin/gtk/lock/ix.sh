{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/jovanlanik/gtklock/archive/refs/tags/v1.2.0.tar.gz
sha:0e4c74ef5a381c20e6ed199038300671dea0d85ff4cf76ffc50810f6056ff000
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3
lib/wayland
lib/pam/unix
lib/gtk/layer/shell
{% endblock %}

{% block bld_tool %}
bld/pkg/config
bin/wayland/protocols
{% endblock %}

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('gtklock')}}
{% endblock %}
