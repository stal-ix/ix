{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprwayland-scanner
{% endblock %}

{% block version %}
0.4.4
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprwayland-scanner/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:ac73f626019f8d819ff79a5fca06ce4768ce8a3bded6f48c404445f3afaa25ac
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/pugixml
{% endblock %}

{% block postinstall %}
:
{% endblock %}
