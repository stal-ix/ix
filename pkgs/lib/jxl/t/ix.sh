{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libjxl
{% endblock %}

{% block version %}
0.13.0
{% endblock %}

{% block fetch %}
https://github.com/libjxl/libjxl/archive/refs/tags/v{{self.version().strip()}}.tar.gz
24d18c9af2d1f5a17730b3f8d3f70a5c16e5ac303f5d9d5fe9dc00cf7ca82af2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/png
lib/brotli
lib/lcms/2
lib/highway
{% endblock %}

{% block patch %}
{% if wasi %}
sed -e '/include(jxl_threads.cmake)/d' -i lib/CMakeLists.txt
{% endif %}
{% endblock %}

{% block cmake_flags %}
JPEGXL_STATIC=ON
JPEGXL_EMSCRIPTEN=OFF

JPEGXL_ENABLE_BENCHMARK=OFF
JPEGXL_ENABLE_EXAMPLES=OFF
JPEGXL_ENABLE_PLUGINS=OFF
JPEGXL_ENABLE_SKCMS=OFF
JPEGXL_ENABLE_SJPEG=OFF
#JPEGXL_ENABLE_JPEGLI=OFF
JPEGXL_ENABLE_VIEWERS=OFF
JPEGXL_ENABLE_FUZZERS=OFF
JPEGXL_ENABLE_MANPAGES=OFF
{% if wasi %}
JPEGXL_ENABLE_TOOLS=OFF
JPEGXL_ENABLE_OPENEXR=OFF
{% endif %}

JPEGXL_BUNDLE_LIBPNG=OFF

JPEGXL_FORCE_SYSTEM_BROTLI=ON
JPEGXL_FORCE_SYSTEM_LCMS2=ON
JPEGXL_FORCE_SYSTEM_GTEST=ON
JPEGXL_FORCE_SYSTEM_HWY=ON

{% if x86_64 %}
JPEGXL_ENABLE_AVX512=ON
JPEGXL_ENABLE_AVX512_SPR=ON
{% endif %}
{% endblock %}
