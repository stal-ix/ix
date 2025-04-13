{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
utfcpp
{% endblock %}

{% block version %}
4.0.6
{% endblock %}

{% block fetch %}
https://github.com/nemtrif/utfcpp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:6920a6a5d6a04b9a89b2a89af7132f8acefd46e0c2a7b190350539e9213816c0
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
