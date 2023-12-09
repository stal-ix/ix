{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://gitlab.com/inkscape/lib2geom/-/archive/1.3/lib2geom-1.3.tar.bz2
sha:bd07f2a1322fcad16a55a1901207faa55dffdecebc56a00eabd4575f62e043c9
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
