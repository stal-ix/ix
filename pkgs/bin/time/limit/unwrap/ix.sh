{% extends '//die/c/make.sh' %}

{% block version %}
1.9.5
{% endblock %}

{% block pkg_name %}
timelimit
{% endblock %}

{% block fetch %}
https://devel.ringlet.net/files/sys/timelimit/timelimit-{{self.version().strip()}}.tar.xz
96b39c61a850d3395eaf4dde5fd22c290854d42ff69f192b12aef05d99d5ddbb
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
