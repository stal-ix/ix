{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/gabime/spdlog/archive/refs/tags/v1.13.0.tar.gz
sha:534f2ee1a4dcbeb22249856edfb2be76a1cf4f708a20b0ac2ed090ee24cfdbc9
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
