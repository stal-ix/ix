{% extends '//die/c/cmake.sh' %}

{% block version %}
1.15.2
{% endblock %}

{% block fetch %}
https://github.com/gabime/spdlog/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:7a80896357f3e8e920e85e92633b14ba0f229c506e6f978578bdc35ba09e9a5d
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
