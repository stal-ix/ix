{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprwayland-scanner
{% endblock %}

{% block version %}
0.4.5
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprwayland-scanner/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2125d279eea106e3e6c8dc9fa15181c75d67467b5352d24e2a07903b10abad62
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/pugixml
{% endblock %}

{% block postinstall %}
:
{% endblock %}
