{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libcap-ng
{% endblock %}

{% block version %}
0.9.1
{% endblock %}

{% block fetch %}
https://github.com/stevegrubb/libcap-ng/archive/refs/tags/v{{self.version().strip()}}.tar.gz
52418b8940f83dcc00dcd01d187e67c3399ff65f3fa558442e3a21b415cc46c0
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}
