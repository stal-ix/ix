{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/gabime/spdlog/archive/refs/tags/v1.15.0.tar.gz
sha:9962648c9b4f1a7bbc76fd8d9172555bad1871fdb14ff4f842ef87949682caa5
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
