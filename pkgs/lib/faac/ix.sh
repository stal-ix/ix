{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
faac
{% endblock %}

{% block version %}
2.2
{% endblock %}

{% block fetch %}
https://github.com/knik0/faac/archive/refs/tags/faac-{{self.version().strip()}}.tar.gz
a93963573907c83e26e8cfabbf80d3a9c360f06ea4ecf1ea6cb74a202494d8d9
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
