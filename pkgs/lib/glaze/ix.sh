{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
glaze
{% endblock %}

{% block version %}
6.0.1
{% endblock %}

{% block fetch %}
https://github.com/stephenberry/glaze/archive/refs/tags/v{{self.version().strip()}}.tar.gz
fecf2b15c4f375f13d5c84e7b5da79d5f90a76edeeef9501a4d0519eb8a4d6c7
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
glaze_BUILD_EXAMPLES=OFF
glaze_DEVELOPER_MODE=OFF
glaze_ENABLE_FUZZING=OFF
glaze_INSTALL_CMAKEDIR=${out}/lib/cmake/glaze
{% endblock %}
