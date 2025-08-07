{% extends '//die/c/premake.sh' %}

{% block pkg_name %}
efsw
{% endblock %}

{% block version %}
1.5.0
{% endblock %}

{% block fetch %}
https://github.com/SpartanJ/efsw/archive/refs/tags/{{self.version().strip()}}.tar.gz
20421778fd59a845393ff6a7a1f461228574fe5062b1bf5f82d533c0d25a41bd
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block make_flags %}
-C make/linux
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cpp_missing %}
sys/select.h
{% endblock %}

{% block setup_target_flags %}
export CPPFLAGS="-Du_int32_t=uint32_t ${CPPFLAGS}"
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp bin/efsw* ${out}/bin/efsw
{% endblock %}
