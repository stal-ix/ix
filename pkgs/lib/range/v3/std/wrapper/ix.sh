{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/include

cat << EOF > ${out}/include/ranges
#pragma once

#include <range/v3/all.hpp>
#include <range/v3/iterator_range.hpp>

namespace std::ranges {
    using namespace ::ranges;
}

namespace std::views {
    using namespace ::ranges::views;
}
EOF
{% endblock %}

{% block env %}
export CPPFLAGS="-DRANGES_DISABLE_DEPRECATED_WARNINGS=1 \${CPPFLAGS}"
{% endblock %}
