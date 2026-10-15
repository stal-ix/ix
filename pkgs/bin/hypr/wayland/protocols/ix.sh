{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprland-protocols
{% endblock %}

{% block version %}
0.7.1
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprland-protocols/archive/refs/tags/v{{self.version().strip()}}.tar.gz
178fa406a1c76e94efeed5d1488abd6029427865f6fd4caf296c71ffaf0d069e
{% endblock %}

{% block strip_pc %}
:
{% endblock %}
