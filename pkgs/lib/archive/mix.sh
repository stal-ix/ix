{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/libarchive/libarchive/archive/refs/tags/v3.6.0.tar.gz
sha:9f9c1a21e570242c0d2854964d5e9ce00bb87144c19feac282b027146a86d0e3
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
