{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://jugit.fz-juelich.de/mlz/libcerf/-/archive/v2.3/libcerf-v2.3.tar.bz2
sha:5fce0a90dc30d0ac7ac90d6df752080d2d346cd49154706e4397e2a9a3b826f7
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
