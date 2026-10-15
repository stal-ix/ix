{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
utfcpp
{% endblock %}

{% block version %}
4.2.1
{% endblock %}

{% block fetch %}
https://github.com/nemtrif/utfcpp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6d6a5493a111884cc085ee31babfe6d9960c8fb08fc80a64852eaeea8323dbc1
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

{% block install %}
{{super()}}
mkdir -p ${out}/lib/cmake
mv ${out}/share/utf8cpp/cmake ${out}/lib/cmake/utf8cpp
{% endblock %}
