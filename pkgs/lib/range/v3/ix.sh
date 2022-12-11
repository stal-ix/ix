{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ericniebler/range-v3/archive/refs/tags/0.12.0.tar.gz
sha:015adb2300a98edfceaf0725beec3337f542af4915cec4d0b89fa0886f4ba9cb
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
RANGE_V3_DOCS=OFF
RANGE_V3_TESTS=OFF
RANGE_V3_EXAMPLES=OFF
RANGE_V3_PERF=OFF
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block install %}
{{super()}}

cat << EOF > ${out}/include/ranges
#pragma once

#include <range/v3/all.hpp>

namespace std::ranges {
    using namespace ::ranges;
}

namespace std::views {
    using namespace ::ranges::views;
}
EOF
{% endblock %}
