{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/opencv/opencv/archive/refs/tags/4.5.5.tar.gz
sha:a1cfdcf6619387ca9e232687504da996aaa9f7b5689986b8331ec02cb61d28ad
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/png
lib/webp
lib/jpeg
lib/tiff
lib/quirc
lib/openexr
lib/jpeg/open
lib/intel/tbb
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block cmake_flags %}
WITH_ITT=OFF
WITH_OPENCL=OFF
WITH_PROTOBUF=OFF
BUILD_PROTOBUF=OFF
BUILD_TESTS=OFF
BUILD_PERF_TESTS=OFF
OPENCV_ENABLE_NONFREE=ON
OPENCV_GENERATE_PKGCONFIG=ON
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block install %}
{{super()}}
>${out}/lib/opencv4/3rdparty/libquirc.a
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/opencv4 \${CPPFLAGS}"
{% endblock %}
