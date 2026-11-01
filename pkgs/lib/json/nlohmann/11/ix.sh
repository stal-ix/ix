{% extends '//lib/json/nlohmann/t/ix.sh' %}

# noauto

{% block pkg_name %}
json
{% endblock %}

{% block version %}
3.11.3
{% endblock %}

{% block fetch %}
https://github.com/nlohmann/json/archive/refs/tags/v{{self.version().strip()}}.tar.gz
0d8ef5af7f9794e3263480193c491549b2ba6cc74bb018906202ada498a79406
{% endblock %}

{% block install %}
{{super()}}
mkdir ${out}/lib
mv ${out}/share/pkgconfig ${out}/lib/
{% endblock %}

{% block test %}
. ${out}/env
c++ -std=c++20 -DJSON_HAS_RANGES=1 ${CPPFLAGS} ${CXXFLAGS} ${CFLAGS} -c -x c++ - << EOF
#include <nlohmann/json.hpp>
EOF
{% endblock %}
