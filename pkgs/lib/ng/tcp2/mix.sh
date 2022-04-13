{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v0.3.1.tar.gz
sha:e0f3271325dad24bbe83d88dc3aef1adcf6ef2224124d454ce2c3e0668aa138b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ENABLE_LIB_ONLY=OFF
ENABLE_STATIC_LIB=OFF
{% endblock %}
