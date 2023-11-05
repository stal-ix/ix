{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/nemtrif/utfcpp/archive/refs/tags/v4.0.2.tar.gz
sha:d3c032650cd30823b7ebbebbe91f39d8c0e91221b2e3e92b93ca425478f986f2
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
