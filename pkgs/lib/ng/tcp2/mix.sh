{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v0.4.0.tar.gz
sha:5a92c578411f60432c7d8cfe50f4d8edf8f0f6548fce02ed53e78a21a9cda092
{% endblock %}

{% block lib_deps %}
lib/c
lib/ev
lib/openssl
lib/ng/http/3
{% endblock %}

{% block cmake_flags %}
ENABLE_OPENSSL=ON
ENABLE_LIB_ONLY=OFF
ENABLE_STATIC_LIB=OFF
{% endblock %}
