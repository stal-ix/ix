{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libjxl/libjxl/archive/refs/tags/v0.8.1.tar.gz
sha:60f43921ad3209c9e180563025eda0c0f9b1afac51a2927b9ff59fff3950dc56
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
JPEGXL_STATIC=ON
JPEGXL_EMSCRIPTEN=OFF

JPEGXL_ENABLE_BENCHMARK=OFF
JPEGXL_ENABLE_EXAMPLES=OFF
JPEGXL_ENABLE_PLUGINS=OFF
JPEGXL_ENABLE_SKCMS=OFF
JPEGXL_ENABLE_SJPEG=OFF
JPEGXL_ENABLE_VIEWERS=OFF

JPEGXL_BUNDLE_LIBPNG=OFF

JPEGXL_FORCE_SYSTEM_BROTLI=ON
JPEGXL_FORCE_SYSTEM_LCMS2=ON
JPEGXL_FORCE_SYSTEM_GTEST=ON
JPEGXL_FORCE_SYSTEM_HWY=ON
{% endblock %}
