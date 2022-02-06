{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/mauke/unibilium/archive/refs/tags/v2.0.0.tar.gz
a89b8ef6e752cc76098e1863ff4b5457
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/gzip
bin/auto/libtool
{% endblock %}

{% block run_data %}
aux/terminfo
{% endblock %}

{% block make_flags %}
TERMINFO_DIRS="\"${TERMINFO}\""
{% endblock %}
