{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
tinyalsa
{% endblock %}

{% block version %}
2.0.0
{% endblock %}

{% block fetch %}
https://github.com/tinyalsa/tinyalsa/archive/refs/tags/v{{self.version().strip()}}.tar.gz
573ae0b2d3480851c1d2a12503ead2beea27f92d44ed47b74b553ba947994ef1
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
