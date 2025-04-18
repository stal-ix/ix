{% extends '//die/c/make.sh' %}

{% block version %}
1.9.2
{% endblock %}

{% block pkg_name %}
timelimit
{% endblock %}

{% block fetch %}
https://devel.ringlet.net/files/sys/timelimit/timelimit-{{self.version().strip()}}.tar.xz
sha:9cdd1f06049b9e1a4b7a8a93a0d4d0e1920bd617e7cd005525261a3f91386796
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
