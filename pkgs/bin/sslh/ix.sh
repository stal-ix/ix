{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/yrutschle/sslh/archive/refs/tags/v2.1.0.tar.gz
sha:5c9cdc4f35a0f875b69932ef0fb09abd04c538735ceaf8bb8c97f3efa6e1d02e
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
