{% extends '//die/c/autohell.sh' %}

{% block version %}
2.1.3
{% endblock %}

{% block fetch %}
https://github.com/yrutschle/sslh/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:e5d55db40cd2e0dd886e226465d68e7a3503ca116b2e685d20423be0a7e3b8ab
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
