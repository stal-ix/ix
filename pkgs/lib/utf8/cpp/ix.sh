{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
utfcpp
{% endblock %}

{% block version %}
4.0.8
{% endblock %}

{% block fetch %}
https://github.com/nemtrif/utfcpp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f808b26d8c3a59def27fea207182ece77a8930bd121a69f80d328ecf3cfef925
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
