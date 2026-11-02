{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
firejail
{% endblock %}

{% block version %}
0.9.82
{% endblock %}

{% block fetch %}
https://github.com/netblue30/firejail/archive/refs/tags/{{self.version().strip()}}.tar.gz
45070b483bff52bd811a5cc8b6a05aa53700acbbd6e33bbfc2daa78453b9dfc4
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
