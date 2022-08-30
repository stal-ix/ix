{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libical/libical/archive/refs/tags/v3.0.14.tar.gz
sha:4284b780356f1dc6a01f16083e7b836e63d3815e27ed0eaaad684712357ccc8f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/xml/2
lib/glib
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
