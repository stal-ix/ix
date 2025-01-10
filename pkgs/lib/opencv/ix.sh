{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/opencv/opencv/archive/refs/tags/4.11.0.tar.gz
sha:9a7c11f924eff5f8d8070e297b322ee68b9227e003fd600d4b8122198091665f
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
sed -e 's|/../../../../../../|/../../../|' \
    -i ${out}/lib/cmake/opencv4/OpenCVConfig.cmake
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/opencv4 \${CPPFLAGS}"
{% endblock %}
