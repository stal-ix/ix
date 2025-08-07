{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprcursor
{% endblock %}

{% block version %}
0.1.13
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprcursor/archive/refs/tags/v{{self.version().strip()}}.tar.gz
82af8b2ce27242ffdd6baebaa71b3f6c8665dc25c52bfcfccc16912622896af8
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/zip
lib/cairo
lib/hypr/lang
lib/toml/plus/plus
{% endblock %}

{% block bld_libs %}
lib/hypr/rsvg
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
