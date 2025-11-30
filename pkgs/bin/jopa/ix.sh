{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/7mind/jopa/archive/refs/tags/v2.0.0.tar.gz
1145a481872b4b044eb7d2f8f142fd71c1f0b6f4999965e327496b61bc776b89
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/icu
lib/zip
{% endblock %}

{% block bld_tool %}
bld/make
bld/python
bld/fake(tool_name=jar)
{% endblock %}

{% block cmake_flags %}
JOPA_BUILD_JAMVM=OFF
{% endblock %}

{% block build_flags %}
no_werror
{% endblock %}

{% block ninja_targets %}
src/jopa
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/src/jopa ${out}/bin/
{% endblock %}
