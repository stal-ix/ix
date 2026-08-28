{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libcap-ng
{% endblock %}

{% block version %}
0.9.5
{% endblock %}

{% block fetch %}
https://github.com/stevegrubb/libcap-ng/archive/refs/tags/v{{self.version().strip()}}.tar.gz
a2b4211f59b231d607c61ea2a13e9ecb38f446fe769b44e12da939d5af6d978a
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
