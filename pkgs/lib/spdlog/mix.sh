{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/gabime/spdlog/archive/refs/tags/v1.10.0.tar.gz
sha:697f91700237dbae2326b90469be32b876b2b44888302afbc7aceb68bcfe8224
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/fmt
{% endblock %}

{% block cmake_flags %}
SPDLOG_FMT_EXTERNAL=ON
SPDLOG_BUILD_EXAMPLE=OFF
{% endblock %}
