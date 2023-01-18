{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libjxl/libjxl/archive/refs/tags/v0.8.0.tar.gz
sha:6b4c140c1738acbed6b7d22858e0526373f0e9938e3f6c0a6b8943189195aad1
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/png
lib/brotli
lib/lcms/2
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
