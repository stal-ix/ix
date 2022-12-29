{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/opencv/opencv/archive/refs/tags/4.7.0.tar.gz
sha:8df0079cdbe179748a18d44731af62a245a45ebf5085223dc03133954c662973
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
lib/kernel
{% endblock %}

{% block cmake_flags %}
WITH_ITT=OFF
WITH_OPENCL=OFF
BUILD_TESTS=OFF
WITH_PROTOBUF=OFF
BUILD_PROTOBUF=OFF
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
sed -e 's|/../../../../../../|/../../../|' \
    -i ${out}/lib/cmake/opencv4/OpenCVConfig.cmake
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/opencv4 \${CPPFLAGS}"
{% endblock %}
