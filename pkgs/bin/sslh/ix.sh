{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/yrutschle/sslh/archive/refs/tags/v2.1.1.tar.gz
sha:28eaa46b0fdcc0b1855f524a5a12480f1c93f8b4961c48574afc7a7785604405
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
