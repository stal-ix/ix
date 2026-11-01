{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprland-protocols
{% endblock %}

{% block version %}
0.8.0
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprland-protocols/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e41ab206d89259fdf2059fdc523c39133e23ed9efa8b0ef0de9aeed61be96e72
{% endblock %}

{% block strip_pc %}
:
{% endblock %}
