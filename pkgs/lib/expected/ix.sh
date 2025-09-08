{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
expected
{% endblock %}

{% block version %}
1.3.1
{% endblock %}

{% block fetch %}
https://github.com/TartanLlama/expected/archive/refs/tags/v{{self.version().strip()}}.tar.gz
9a04f4f472fbb5c30bf60402f1ca626c4a76987f867978d0b8a35d7ab3fb8fe7
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
EXPECTED_BUILD_TESTS=OFF
EXPECTED_BUILD_PACKAGE=OFF
{% endblock %}

{% block install %}
{{super()}}
mkdir ${out}/lib
mv ${out}/share/cmake ${out}/lib/
cd ${out}/lib/cmake/tl-expected
for i in *.cmake; do
    sed -e 's|/share|/lib|' -i ${i}
done
{% endblock %}
