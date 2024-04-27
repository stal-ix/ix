{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/gabime/spdlog/archive/refs/tags/v1.14.0.tar.gz
sha:429a6b73ade8285cb21f83bacf89e2821dd1720ea7faa3cb518ffe04b4e00efc
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/fmt
{% endblock %}

{% block cmake_flags %}
SPDLOG_FMT_EXTERNAL=ON
SPDLOG_BUILD_EXAMPLE=OFF
#SPDLOG_USE_STD_FORMAT=ON
{% endblock %}

{% block env %}
export CPPFLAGS="-DSPDLOG_FMT_EXTERNAL \${CPPFLAGS}"
{% endblock %}
