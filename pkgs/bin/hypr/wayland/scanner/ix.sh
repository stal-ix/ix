{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprwayland-scanner/archive/refs/tags/v0.4.2.tar.gz
sha:2f1e54336ed6cc3dbab5ad5279f2520eae1a90fc80852ab005a8250a5a15d1ac
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/pugixml
{% endblock %}

{% block postinstall %}
:
{% endblock %}

