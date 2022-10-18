{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libical/libical/archive/refs/tags/v3.0.16.tar.gz
sha:b44705dd71ca4538c86fb16248483ab4b48978524fb1da5097bd76aa2e0f0c33
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
