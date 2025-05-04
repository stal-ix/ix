{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
sslh
{% endblock %}

{% block version %}
2.2.3
{% endblock %}

{% block fetch %}
https://github.com/yrutschle/sslh/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:236a361e203aec839640c9ba9a2968e287ad368f4a0fc9012eef980deb30363f
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
