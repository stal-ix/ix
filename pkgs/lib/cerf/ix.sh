{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libcerf
{% endblock %}

{% block version %}
3.4
{% endblock %}

{% block fetch %}
https://jugit.fz-juelich.de/mlz/libcerf/-/archive/v{{self.version().strip()}}/libcerf-v{{self.version().strip()}}.tar.bz2
d70ab4d0d82fa7e456cbeac00f1b1ff494a6720b8d001cbe4c95cbead50bddc0
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
