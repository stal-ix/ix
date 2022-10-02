{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/jovanlanik/gtklock/archive/refs/tags/v1.4.0.tar.gz
sha:4aebf519c187eaf9dbfa1e4ecef69a806324ed287553a7a17ee8bbe7d555de29
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3
lib/wayland
lib/pam/unix
lib/gtk/layer/shell
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
bld/pkg/config
{% endblock %}

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('gtklock')}}
{% endblock %}
