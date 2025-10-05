{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
hyprland-protocols
{% endblock %}

{% block version %}
0.7.0
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprland-protocols/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ee419006d7cd20927b9b7c8b5fc430571c151b0385d600508de1a7957294498c
{% endblock %}

{% block strip_pc %}
:
{% endblock %}
