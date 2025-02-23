{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/stephenberry/glaze/archive/refs/tags/v4.4.3.tar.gz
sha:d0dd03f156f95860bf9c2957da0704ee0f7651e21089ff34e3d26fa0190e8684
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
