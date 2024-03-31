{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libical/libical/archive/refs/tags/v3.0.18.tar.gz
sha:72b7dc1a5937533aee5a2baefc990983b66b141dd80d43b51f80aced4aae219c
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
