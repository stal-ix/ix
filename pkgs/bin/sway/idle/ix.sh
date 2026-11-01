{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
swayidle
{% endblock %}

{% block version %}
1.9.1
{% endblock %}

{% block fetch %}
https://github.com/swaywm/swayidle/archive/refs/tags/v{{self.version().strip()}}.tar.gz
846372a151e9f65bbc50e86d600fc7d7f9e494c3e2fcbc23b4d1ead9a13bcd1e
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}
