{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
glaze
{% endblock %}

{% block version %}
5.2.0
{% endblock %}

{% block fetch %}
https://github.com/stephenberry/glaze/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:761b4bc97482f2e20273b3d180059b870c6996e7f9ab58eecdc675b44044c7da
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
