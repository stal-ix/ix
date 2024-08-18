{% extends '//lib/ubpf/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/bpf
lib/boost
lib/kernel
{% endblock %}

{% block cmake_flags %}
{{super()}}
UBPF_ENABLE_TESTS=ON
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/bin/ubpf_* ${out}/bin/
{% endblock %}
