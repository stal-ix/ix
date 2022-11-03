{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/gabime/spdlog/archive/refs/tags/v1.11.0.tar.gz
sha:ca5cae8d6cac15dae0ec63b21d6ad3530070650f68076f3a4a862ca293a858bb
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
