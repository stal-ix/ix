{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/P-H-C/phc-winner-argon2/archive/refs/tags/20190702.tar.gz
sha:daf972a89577f8772602bf2eb38b6a3dd3d922bf5724d45e7f9589b5e830442c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_flags %}
LIBRARY_REL=lib
{% endblock %}

{% block install %}
{{super()}}
cp libargon2.a ${out}/lib/
{% endblock %}

{% block c_rename_symbol %}
blake2b_init
blake2b_init_key
blake2b_init_param
blake2b_update
blake2b_final
blake2b
{% endblock %}
