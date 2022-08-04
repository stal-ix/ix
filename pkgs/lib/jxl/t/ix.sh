{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libjxl/libjxl/archive/d4e2f3970b4b4ddf2f318ae651148798d6af950e.zip
sha:6432ba97f4a11a6fbc0eb4ff223d743f82b2637df0ed81bb94eddb8b2861eca8
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/png
lib/lcms2
lib/brotli
lib/highway
{% endblock %}

{% block bld_libs %}
#lib/gflags
#lib/googletest
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
