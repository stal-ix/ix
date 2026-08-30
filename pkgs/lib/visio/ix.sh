{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libvisio
{% endblock %}

{% block version %}
0.1.11
{% endblock %}

{% block fetch %}
https://dev-www.libreoffice.org/src/libvisio/libvisio-{{self.version().strip()}}.tar.xz
2a6efd40b6d9dbcb70fba3be53112366882ba97b57151df3698dfa478c8d8dd3
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
