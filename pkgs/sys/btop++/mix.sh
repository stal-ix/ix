{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/aristocratos/btop/archive/3cc19a511c24dcbb43e406ef44c8e153f3522099.zip
48d0d3cff18fbe658409cfe6f5ad4b12
{% endblock %}

{% block bld_libs %}
sys/btop++/libs
{% endblock %}

{% block make_flags %}
CXX=clang++
OPTFLAGS=
{% endblock %}

{% block setup %}
export CPPFLAGS="-I${PWD} ${CPPFLAGS}"
{% endblock %}

{% block patch %}
cat << EOF > ranges.hh
#include <range/v3/all.hpp>

namespace std::ranges {
    using namespace ::ranges;
}

namespace std::views {
    using namespace ::ranges::views;
}
EOF

find . | while read l; do
    if test -f ${l}; then
        sed -e 's|<ranges>|<ranges.hh>|g' \
            -e 's|std::setlocale|setlocale|g' \
            -i ${l}
    fi
done

sed -e 's|.*current_procs.erase.*||' \
    -i src/linux/btop_collect.cpp
{% endblock %}
