{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libarchive/libarchive/archive/refs/tags/v3.6.2.tar.gz
sha:652b84588488c2ff38db8f666cd7f781163f85bff4449dcb2e16d3c734f96697
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
