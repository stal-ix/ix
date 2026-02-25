{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
glaze
{% endblock %}

{% block version %}
7.0.2
{% endblock %}

{% block fetch %}
https://github.com/stephenberry/glaze/archive/refs/tags/v{{self.version().strip()}}.tar.gz
febbec555648b310c2a1975ca750939cd00c4801dede8362fcf84cab7b3ae46f
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
