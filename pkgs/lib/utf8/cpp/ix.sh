{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
utfcpp
{% endblock %}

{% block version %}
5.0.0
{% endblock %}

{% block fetch %}
https://github.com/nemtrif/utfcpp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
42c36e1ef1307b1186996e4644f9999970e26325670b99019f3408bf0d3c952a
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
