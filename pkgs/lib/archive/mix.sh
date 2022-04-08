{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/libarchive/libarchive/archive/refs/tags/v3.6.1.tar.gz
sha:3d5dce7be5ed9b2c239e25b0579167c133296d9dedd17b484b678aec6c010b62
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/lz4
lib/lzo
lib/zstd
lib/bzip2
lib/iconv
lib/expat
{% endblock %}

{% block patch %}
sed -e 's|.*PROPERTIES OUTPUT_NAME archive.*||' -i libarchive/CMakeLists.txt
{% endblock %}

{% block cmake_flags %}
ENABLE_TEST=OFF
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/*_static*
{% endblock %}
