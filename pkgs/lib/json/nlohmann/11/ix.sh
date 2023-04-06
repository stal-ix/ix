{% extends '//lib/json/nlohmann/t/ix.sh' %}

{% block fetch %}
https://github.com/nlohmann/json/archive/refs/tags/v3.11.2.tar.gz
sha:d69f9deb6a75e2580465c6c4c5111b89c4dc2fa94e3a85fcd2ffcd9a143d9273
{% endblock %}

{% block lib_deps %}
lib/range/v3/std
{{super()}}
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
