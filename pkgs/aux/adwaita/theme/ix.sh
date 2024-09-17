{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GNOME/adwaita-icon-theme/archive/refs/tags/47.0.tar.gz
sha:e0845b6a398b67e048a3b1a2700b4da16f90b95c19d0ea1ff0ba65d78609dd2f
{% endblock %}

{% block bld_tool %}
bld/gnome
{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): check it'
{% endblock %}
