{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
sslh
{% endblock %}

{% block version %}
2.3.0
{% endblock %}

{% block fetch %}
https://github.com/yrutschle/sslh/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d9e1ca6a392ace2aad9e9b9df8a6391c9332c95df81790df944488b7011a37a0
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
