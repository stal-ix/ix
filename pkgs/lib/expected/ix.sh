{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/TartanLlama/expected/archive/96d547c03d2feab8db64c53c3744a9b4a7c8f2c5.tar.gz
sha:64901df1de9a5a3737b331d3e1de146fa6ffb997017368b322c08f45c51b90a7
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
