{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/yrutschle/sslh/archive/refs/tags/v2.0.1.tar.gz
sha:0e92a53432bb62a45095f5478546fecb65b9013b972c3ee9b405044daf7a19ac
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
