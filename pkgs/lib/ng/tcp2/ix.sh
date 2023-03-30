{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v0.14.1.tar.gz
sha:5871f8eb78b91ba8b8c5b98ec10ac689684cb711cf990d5aab8777bd95af63b4
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
