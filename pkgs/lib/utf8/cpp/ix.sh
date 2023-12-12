{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/nemtrif/utfcpp/archive/refs/tags/v4.0.4.tar.gz
sha:7c8a403d0c575d52473c8644cd9eb46c6ba028d2549bc3e0cdc2d45f5cfd78a0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
UTF8_TESTS=OFF
UTF8_SAMPLES=OFF
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/utf8cpp \${CPPFLAGS}"
{% endblock %}
