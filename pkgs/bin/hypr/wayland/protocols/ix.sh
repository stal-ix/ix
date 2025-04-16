{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
hyprland-protocols
{% endblock %}

{% block version %}
0.6.4
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprland-protocols/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:0d4f99abc21b04fc126dd754e306bb84cd334131d542ff2e0c172190c6570384
{% endblock %}

{% block strip_pc %}
:
{% endblock %}
