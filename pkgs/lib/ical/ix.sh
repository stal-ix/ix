{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libical/libical/archive/refs/tags/v3.0.17.tar.gz
sha:bcda9a6db6870240328752854d1ea475af9bbc6356e6771018200e475e5f781b
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
