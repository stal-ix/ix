{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
leptonica
{% endblock %}

{% block version %}
1.86.0
{% endblock %}

{% block fetch %}
https://github.com/DanBloomberg/leptonica/archive/refs/tags/{{self.version().strip()}}.tar.gz
b4447faf61a8786a9b211d58d4103d85d47fd3a5dd418d5a6bc525d41db54ccc
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/png
lib/gif
lib/tiff
lib/jpeg
lib/webp
lib/jpeg/open
{% endblock %}

{% block cmake_flags %}
BUILD_PROG=OFF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|if ()|if (TRUE)|' -i ${out}/lib/cmake/leptonica/LeptonicaConfig.cmake
sed -e 's|.*exec_prefix.*||' -i ${out}/lib/pkgconfig/lept.pc
{% endblock %}
