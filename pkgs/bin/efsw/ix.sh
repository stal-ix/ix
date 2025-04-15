{% extends '//die/c/premake.sh' %}

{% block pkg_name %}
efsw
{% endblock %}

{% block version %}
1.4.1
{% endblock %}

{% block fetch %}
https://github.com/SpartanJ/efsw/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:f0ddee587928737c6a3dc92eb88266a804c77279cbdf29d47e5e6f6ad6c7fd9a
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
