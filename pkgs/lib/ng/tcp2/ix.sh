{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v0.15.0.tar.gz
sha:ea3a9189e771209d44f46fcb942415fa386a1d66e4e1108ed3bc0fce0439d2f5
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
