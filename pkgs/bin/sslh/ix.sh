{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
sslh
{% endblock %}

{% block version %}
2.2.1
{% endblock %}

{% block fetch %}
https://github.com/yrutschle/sslh/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:b0201b469f39079d96c5a5dd98b2a25ef132f104d1553fa73ea2f69a0ac401a2
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
