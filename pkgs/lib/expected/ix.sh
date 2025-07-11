{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
expected
{% endblock %}

{% block version %}
1.1.0
{% endblock %}

{% block fetch %}
https://github.com/TartanLlama/expected/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1db357f46dd2b24447156aaf970c4c40a793ef12a8a9c2ad9e096d9801368df6
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
