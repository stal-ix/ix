{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libcerf
{% endblock %}

{% block version %}
3.1
{% endblock %}

{% block fetch %}
https://jugit.fz-juelich.de/mlz/libcerf/-/archive/v{{self.version().strip()}}/libcerf-v{{self.version().strip()}}.tar.bz2
8ab960951172035d3cf957db7ac0fe01b3504c5d7cde5ef56afdf39837604bed
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
