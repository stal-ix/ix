{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v0.17.0.tar.gz
sha:c920c7d98d7320c1e6b811d0bbf646c47d788dc19f5bfd9256014f6bb7d8f0a8
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

{% block setup %}
# for example
export CXXFLAGS="-std=c++17 ${CXXFLAGS}"
{% endblock %}

{% block patch %}
touch crypto/includes/ngtcp2/ngtcp2_crypto_openssl.h
{% endblock %}
