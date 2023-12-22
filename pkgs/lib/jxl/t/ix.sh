{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libjxl/libjxl/archive/refs/tags/v0.9.0.tar.gz
sha:d83bbe188d8fa9725bb75109c922c37fcff8c3b802808f3a6c2c14aaf8337d9f
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
JPEGXL_ENABLE_JPEGLI=OFF
JPEGXL_ENABLE_VIEWERS=OFF

JPEGXL_BUNDLE_LIBPNG=OFF

JPEGXL_FORCE_SYSTEM_BROTLI=ON
JPEGXL_FORCE_SYSTEM_LCMS2=ON
JPEGXL_FORCE_SYSTEM_GTEST=ON
JPEGXL_FORCE_SYSTEM_HWY=ON
{% endblock %}
