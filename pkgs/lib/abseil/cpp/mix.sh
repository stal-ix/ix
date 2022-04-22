{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/abseil/abseil-cpp/archive/refs/tags/20211102.0.tar.gz
sha:dcf71b9cba8dc0ca9940c4b316a0c796be8fab42b070bb6b7cab62b48f0e66c4
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
