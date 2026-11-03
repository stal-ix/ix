{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
firejail
{% endblock %}

{% block version %}
0.9.82.2
{% endblock %}

{% block fetch %}
https://github.com/netblue30/firejail/archive/refs/tags/{{self.version().strip()}}.tar.gz
72399bffeee3ca3f3b9f89a35daebb31224917f06422a15257ebb94184b146a6
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block bld_tool %}
bin/gzip
{% endblock %}

{% block postinstall %}
:
{% endblock %}
