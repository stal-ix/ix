{% extends '//die/c/cmake.sh' %}

{% block version %}
3.0.20
{% endblock %}

{% block fetch %}
https://github.com/libical/libical/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:e73de92f5a6ce84c1b00306446b290a2b08cdf0a80988eca0a2c9d5c3510b4c2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/icu
lib/glib
lib/xml/2
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block cmake_flags %}
ENABLE_GTK_DOC=OFF
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
