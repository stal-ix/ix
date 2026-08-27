{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprwayland-scanner
{% endblock %}

{% block version %}
0.4.6
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprwayland-scanner/archive/refs/tags/v{{self.version().strip()}}.tar.gz
05f55fd1a20d8ca81b5030980fdb7c87147749230145bdb3745af2741d617f5c
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/pugixml
{% endblock %}

{% block postinstall %}
:
{% endblock %}
