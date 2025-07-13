{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
expected
{% endblock %}

{% block version %}
1.2.0
{% endblock %}

{% block fetch %}
https://github.com/TartanLlama/expected/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f5424f5fc74e79157b9981ba2578a28e0285ac6ec2a8f075e86c41226fe33386
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
