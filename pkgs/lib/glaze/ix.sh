{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
glaze
{% endblock %}

{% block version %}
5.5.2
{% endblock %}

{% block fetch %}
https://github.com/stephenberry/glaze/archive/refs/tags/v{{self.version().strip()}}.tar.gz
92382568999829a531db5a3800a36d8699674d640d3862fcb7e79ee2879d95ec
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
