{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://gitlab.com/inkscape/lib2geom/-/archive/1.4/lib2geom-1.4.tar.bz2
sha:717a87ce7f2192271a789c1273ae7b432856c522647b9fe33bb4dd662942b3ea
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
lib/boost
lib/cairo
lib/gsl/gnu
lib/double/conversion
{% endblock %}

{% block bld_tool %}
bin/ragel/6
{% endblock %}

{% block cmake_flags %}
2GEOM_TESTING=OFF
{% endblock %}
