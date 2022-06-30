{% extends '//die/cmake.sh' %}

{% block fetch %}
#https://github.com/abseil/abseil-cpp/archive/refs/tags/20211102.0.tar.gz
#sha:dcf71b9cba8dc0ca9940c4b316a0c796be8fab42b070bb6b7cab62b48f0e66c4
https://github.com/abseil/abseil-cpp/archive/refs/tags/20220623.0.tar.gz
sha:4208129b49006089ba1d6710845a45e31c59b0ab6bff9e5788a87f55c5abd602
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
{% if linux %}
lib/linux
{% endif %}
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
