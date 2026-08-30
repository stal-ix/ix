{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
utfcpp
{% endblock %}

{% block version %}
4.2.0
{% endblock %}

{% block fetch %}
https://github.com/nemtrif/utfcpp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
54a8e96ea835a7359e8e53d03e30e9833d51350cc4615ff53f8449ef19ee46ab
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
