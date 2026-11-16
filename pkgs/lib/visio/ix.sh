{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libvisio
{% endblock %}

{% block version %}
0.1.12
{% endblock %}

{% block fetch %}
https://dev-www.libreoffice.org/src/libvisio/libvisio-{{self.version().strip()}}.tar.xz
f59fa2e3baf95475256fe84ea0aa1214f43940bae94424f4026b2d633933df01
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
