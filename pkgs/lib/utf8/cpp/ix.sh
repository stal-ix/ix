{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/nemtrif/utfcpp/archive/refs/tags/v4.0.1.tar.gz
sha:9014342a716258da00b97bf8c201a2edc4d72d2025cd8d62f0650ac627038f95
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
