{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://jugit.fz-juelich.de/mlz/libcerf/-/archive/v2.2/libcerf-v2.2.tar.bz2
sha:32919dff5d2e260f5319e6df30577caa43d004d6b0d455db88ee844d08329c36
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIB_MAN=OFF
LIB_RUN=OFF
{% endblock %}

{% block patch %}
sed -e 's|add_sub.*test.*||' -i CMakeLists.txt
{% endblock %}
