{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://dev-www.libreoffice.org/src/libvisio/libvisio-0.1.7.tar.xz
sha:8faf8df870cb27b09a787a1959d6c646faa44d0d8ab151883df408b7166bea4c
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
bin/doxygen
{% endblock %}

{% block configure_flags %}
--disable-werror
--disable-tests
{% endblock %}
