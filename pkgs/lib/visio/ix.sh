{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libvisio
{% endblock %}

{% block version %}
0.1.10
{% endblock %}

{% block fetch %}
https://dev-www.libreoffice.org/src/libvisio/libvisio-{{self.version().strip()}}.tar.xz
9e9eff75112d4d92d92262ad7fc2599c21e26f8fc5ba54900efdc83c0501e472
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
