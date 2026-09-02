{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libcerf
{% endblock %}

{% block version %}
3.5
{% endblock %}

{% block fetch %}
https://jugit.fz-juelich.de/mlz/libcerf/-/archive/v{{self.version().strip()}}/libcerf-v{{self.version().strip()}}.tar.bz2
941d766eace1a35f310c32d16faa213fc0fe2603783cca1fd06058a384773e2e
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
