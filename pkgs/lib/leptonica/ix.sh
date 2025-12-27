{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
leptonica
{% endblock %}

{% block version %}
1.87.0
{% endblock %}

{% block fetch %}
https://github.com/DanBloomberg/leptonica/archive/refs/tags/{{self.version().strip()}}.tar.gz
fa2b40c5caea96d1bb93a97486262aed8731b69ce25a84a6bf5d25323e33f631
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
