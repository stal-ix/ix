{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libcerf
{% endblock %}

{% block version %}
3.9
{% endblock %}

{% block fetch %}
https://jugit.fz-juelich.de/mlz/libcerf/-/archive/v{{self.version().strip()}}/libcerf-v{{self.version().strip()}}.tar.bz2
4c5266c08f7fc939b0f51ae546fa1a7eea2cbfb9484a2c6a88bbea0de005d17e
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
