{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/ericniebler/range-v3/archive/9aa032ccd0eb4bd77f58e5b181168f1038c222c6.zip
c40b835c3b7dd751f1c4c3bcf5b99c92
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

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
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
