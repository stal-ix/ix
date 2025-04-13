{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libcap-ng
{% endblock %}

{% block version %}
0.8.5
{% endblock %}

{% block fetch %}
https://github.com/stevegrubb/libcap-ng/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:e4be07fdd234f10b866433f224d183626003c65634ed0552b02e654a380244c2
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
