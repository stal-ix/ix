{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libjxl/libjxl/archive/refs/tags/v0.7rc.tar.gz
sha:17148629624e328cd015439b37bf07fc49245afefa1abaa50ef9e7a56028dcef
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/png
lib/lcms2
lib/brotli
lib/highway
{% endblock %}

{% block cmake_flags %}
JPEGXL_ENABLE_BENCHMARK=OFF
JPEGXL_ENABLE_EXAMPLES=OFF
JPEGXL_ENABLE_PLUGINS=OFF
JPEGXL_STATIC=ON
JPEGXL_FORCE_SYSTEM_BROTLI=ON
JPEGXL_FORCE_SYSTEM_LCMS2=ON
JPEGXL_ENABLE_SKCMS=OFF
JPEGXL_ENABLE_SJPEG=OFF
JPEGXL_ENABLE_VIEWERS=OFF
JPEGXL_EMSCRIPTEN=OFF
JPEGXL_BUNDLE_LIBPNG=OFF
{% endblock %}
