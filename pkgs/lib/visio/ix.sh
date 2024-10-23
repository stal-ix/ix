{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://dev-www.libreoffice.org/src/libvisio/libvisio-0.1.8.tar.xz
sha:b4098ffbf4dcb9e71213fa0acddbd928f27bed30db2d80234813b15d53d0405b
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/icu
lib/xml/2
lib/boost
lib/revenge
{% endblock %}

{% block bld_tool %}
bld/perl
bin/gperf
{% endblock %}

{% block configure_flags %}
--without-docs
--disable-werror
--disable-tests
{% endblock %}
