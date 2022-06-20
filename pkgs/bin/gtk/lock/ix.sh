{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/jovanlanik/gtklock/archive/refs/tags/v1.1.0.tar.gz
sha:e5faec7c7de5df39e9d6d70e6c4ab6dc86fd3f74441d86cc28199dd70b34fc29
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
