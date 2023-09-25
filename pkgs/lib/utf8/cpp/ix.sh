{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/nemtrif/utfcpp/archive/refs/tags/v3.2.5.tar.gz
sha:14fd1b3c466814cb4c40771b7f207b61d2c7a0aa6a5e620ca05c00df27f25afd
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
