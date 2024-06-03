{% extends '//die/c/make.sh' %}

{% block fetch %}
https://gitlab.com/timelimit/timelimit/-/archive/archive/debian/1.9.2-2/timelimit-archive-debian-1.9.2-2.tar.bz2
sha:0e5a020872d72fa99a5cf6e9c63a75525a8157b1550be0311deefd47e5a369a2
{% endblock %}

{% block bld_libs %}
lib/tiny
{% endblock %}

{% block bld_tool %}
bin/gzip
{% endblock %}

{% block make_flags %}
LOCALBASE=${out}
BINOWN=$(whoami)
BINGRP=$(whoami)
SHAREOWN=$(whoami)
SHAREGRP=$(whoami)
{% endblock %}
