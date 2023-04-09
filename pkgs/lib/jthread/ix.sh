{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/josuttis/jthread/archive/0fa8d394254886c555d6faccd0a3de819b7d47f8.tar.gz
sha:d3a20e0c1b2758c4545b0a97490afa2986e39c8b4387c3dba2007def742cbeb0
{% endblock %}

{% block lib_deps %}
lib/c++
{% endblock %}

{% block unpack %}
{{super()}}
cd source
{% endblock %}

{% block install %}
mkdir ${out}/include
cp *.hpp ${out}/include/
{% endblock %}

{% block test %}
. ${out}/env
c++ ${CPPFLAGS} ${CFLAGS} ${CXXFLAGS} -c -x c++ - << EOF
#include <jthread.hpp>
#include <stop_token.hpp>
int main() {
    new std::jthread();
}
EOF
{% endblock %}
