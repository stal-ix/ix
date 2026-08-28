{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
firejail
{% endblock %}

{% block version %}
0.9.80
{% endblock %}

{% block fetch %}
https://github.com/netblue30/firejail/archive/refs/tags/{{self.version().strip()}}.tar.gz
1397bba6774a6361171c72464ddcdcfbc36d44fa413ecc9a1d56092f8da58825
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
