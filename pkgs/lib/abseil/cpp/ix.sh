{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/abseil/abseil-cpp/archive/refs/tags/20230125.0.tar.gz
sha:3ea49a7d97421b88a8c48a0de16c16048e17725c7ec0f1d3ea2683a2a75adc21
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block patch %}
cat << EOF >> absl/base/options.h
#undef ABSL_OPTION_USE_STD_STRING_VIEW
#define ABSL_OPTION_USE_STD_STRING_VIEW 1
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
{% endblock %}
