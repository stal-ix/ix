{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
hyprland-protocols
{% endblock %}

{% block version %}
0.6.2
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprland-protocols/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:bba082af141599d4342e7b8505401a6e3a32be819d9eb23ce6c90f7407e62c1f
{% endblock %}

{% block strip_pc %}
:
{% endblock %}
