{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
swayidle
{% endblock %}

{% block version %}
1.9.0
{% endblock %}

{% block fetch %}
https://github.com/swaywm/swayidle/archive/refs/tags/v{{self.version().strip()}}.tar.gz
161f5827b8c79bc486a472d27690e98d75da6615bb2dee9f24393cbbb13af656
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}
