{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
opencv
{% endblock %}

{% block version %}
5.0.0
{% endblock %}

{% block fetch %}
https://github.com/opencv/opencv/archive/refs/tags/{{self.version().strip()}}.tar.gz
b0528f5a1d379d59d4701cb28c36e22214cc51cf64594e5b56f2d3e6c0233095
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
WITH_IPP=OFF
WITH_OPENCL=OFF
BUILD_TESTS=OFF
BUILD_opencv_gapi=OFF
WITH_ADE=OFF
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
sed -e 's|/../../../../../../|/../../../|' \
    -i ${out}/lib/cmake/opencv4/OpenCVConfig.cmake
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/opencv4 \${CPPFLAGS}"
{% endblock %}
