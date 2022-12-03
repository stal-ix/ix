{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://gitlab.com/inkscape/lib2geom/-/archive/1.2.2/lib2geom-1.2.2.tar.bz2
sha:1c22a7be571d2e2f3ee98424614ffd6a42fe73dedbd2ccfb0967ecb02f77edeb
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
