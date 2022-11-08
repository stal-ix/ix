{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/mauke/unibilium/archive/refs/tags/v2.0.0.tar.gz
md5:a89b8ef6e752cc76098e1863ff4b5457
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bld/gzip
bld/libtool
{% endblock %}

{% block use_data %}
aux/terminfo
{% endblock %}

{% block make_flags %}
TERMINFO_DIRS="\"${TERMINFO}\""
{% endblock %}
