{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
firejail
{% endblock %}

{% block version %}
0.9.76
{% endblock %}

{% block fetch %}
https://github.com/netblue30/firejail/archive/refs/tags/{{self.version().strip()}}.tar.gz
d8dac051fcb7d555cd20579a90ab4a8f123a3f4b803c0b09dca5310abacb7c68
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
