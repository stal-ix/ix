{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
sslh
{% endblock %}

{% block version %}
2.3.1
{% endblock %}

{% block fetch %}
https://github.com/yrutschle/sslh/archive/refs/tags/v{{self.version().strip()}}.tar.gz
416b401cf8f0a43b575f7a1571bafd5375401d741833b27918aaecb200445f92
{% endblock %}

{% block bld_libs %}
lib/c
lib/ev
lib/cap
lib/bsd
lib/pcre/2
lib/config
{% endblock %}

{% block bld_tool %}
bld/perl
bin/gzip
{% endblock %}

{% block make_flags %}
USELIBBSD=1
BINDIR=${out}/bin
{% endblock %}
