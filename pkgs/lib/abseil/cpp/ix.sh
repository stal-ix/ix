{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/abseil/abseil-cpp/archive/refs/tags/20230125.3.tar.gz
sha:5366d7e7fa7ba0d915014d387b66d0d002c03236448e1ba9ef98122c13b35c36
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/execinfo
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block patch %}
cat << EOF > absl/base/options.h
{% include 'options.h' %}
EOF
{% endblock %}

{% block setup %}
export CXXFLAGS="-std=c++20 ${CXXFLAGS}"
{% endblock %}

{% block env %}
export CXXFLAGS="-std=c++20 \${CXXFLAGS}"
{% endblock %}

{% block cmake_flags %}
CMAKE_CXX_STANDARD=20
# we propagate it ourselves
ABSL_PROPAGATE_CXX_STD=OFF
{% endblock %}
