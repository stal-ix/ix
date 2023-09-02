{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/yrutschle/sslh/archive/refs/tags/v2.0.0.tar.gz
sha:45e640dd08f76f0815d000f4b6e7bad376d80c7c3369b73435f2eca73107bc5d
{% endblock %}

{% block bld_libs %}
lib/c
lib/ev
lib/cap
lib/bsd
lib/pcre/2
{% endblock %}

{% block bld_tool %}
bld/perl
bin/gzip
{% endblock %}

{% block make_flags %}
USELIBCONFIG=
USELIBWRAP=
USESYSTEMD=
BINDIR=${out}/bin
{% endblock %}
