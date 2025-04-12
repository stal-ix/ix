{% extends '//die/c/cmake.sh' %}

{% block version %}
1.4
{% endblock %}

{% block fetch %}
https://gitlab.com/inkscape/lib2geom/-/archive/{{self.version().strip()}}/lib2geom-{{self.version().strip()}}.tar.bz2
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
