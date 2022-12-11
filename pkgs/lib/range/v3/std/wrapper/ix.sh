{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/include

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
