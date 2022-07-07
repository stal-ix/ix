{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/DanBloomberg/leptonica/archive/refs/tags/1.82.0.tar.gz
sha:40fa9ac1e815b91e0fa73f0737e60c9eec433a95fa123f95f2573dd3127dd669
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/png
lib/tiff
lib/jpeg
lib/webp
lib/giflib
lib/jpeg/open
{% endblock %}

{% block cmake_flags %}
BUILD_PROG=OFF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*exec_prefix.*||' -i ${out}/lib/pkgconfig/lept.pc
{% endblock %}
