{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/yrutschle/sslh/archive/refs/tags/v2.1.2.tar.gz
sha:7ffafaffbc006bb9d9af4015a10f15982ed182ea2a454a917bdbeb5f04e27a90
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
