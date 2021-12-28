{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/aristocratos/btop/archive/refs/tags/v1.1.3.tar.gz
36de5aa034c4d10941dbbce0ccf85cca
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
