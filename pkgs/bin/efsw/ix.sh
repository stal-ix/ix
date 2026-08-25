{% extends '//die/c/premake.sh' %}

{% block pkg_name %}
efsw
{% endblock %}

{% block version %}
1.6.3
{% endblock %}

{% block fetch %}
https://github.com/SpartanJ/efsw/archive/refs/tags/{{self.version().strip()}}.tar.gz
54981ad19532bf818bb4c6b550dfa577bbfdde928036826b36bf950f936cad52
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
cp bin/efsw-test-debug ${out}/bin/efsw
{% endblock %}
