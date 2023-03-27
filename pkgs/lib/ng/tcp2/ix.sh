{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v0.14.0.tar.gz
sha:3f32a6cf10e565ae435b18bbede14066941c5040029522f2dc71f760e5fb165b
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
