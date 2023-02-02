{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/lyonel/lshw/archive/refs/tags/B.02.19.tar.gz
sha:9a2809b07ad2a2d1c4ee115682e31e7b3116ed536ea70bef962cef1ca3d1553e
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/kernel
lib/shim/gnu
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/fakegit
bld/fake(tool_name=docbook2man)
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|sysconf(_SC_LONG_BIT)|LONG_BIT|' -i ${l}
done
{% endblock %}

{% block make_flags %}
SBINDIR=${out}/bin
{% endblock %}

{% block setup %}
export CXXFLAGS="-Wno-register ${CXXFLAGS}"
{% endblock %}
