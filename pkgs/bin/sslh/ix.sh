{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
sslh
{% endblock %}

{% block version %}
2.2.4
{% endblock %}

{% block fetch %}
https://github.com/yrutschle/sslh/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:e8aa59b4f190a89087eac2ec4e0f44f75d19767bb879907df11c142fa6a7d0d1
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
