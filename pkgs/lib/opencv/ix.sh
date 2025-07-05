{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
opencv
{% endblock %}

{% block version %}
4.12.0
{% endblock %}

{% block fetch %}
https://github.com/opencv/opencv/archive/refs/tags/{{self.version().strip()}}.tar.gz
44c106d5bb47efec04e531fd93008b3fcd1d27138985c5baf4eafac0e1ec9e9d
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
