{% extends '//die/c/make.sh' %}

{% block pkg_name %}
liburing
{% endblock %}

{% block version %}
2.12
{% endblock %}

{% block fetch %}
https://github.com/axboe/liburing/archive/refs/tags/liburing-{{self.version().strip()}}.tar.gz
f1d10cb058c97c953b4c0c446b11e9177e8c8b32a5a88b309f23fdd389e26370
{% endblock %}

{% block lib_deps %}
lib/c
lib/kernel
{% endblock %}

{% block bld_libs %}
lib/shim/gnu
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_flags %}
libgcc_link_flag=-lc
{% endblock %}

{% block configure %}
sh ./configure --prefix=${out}
{% endblock %}

{% block c_rename_symbol %}
aligned_alloc
{% endblock %}

{% block patch %}
echo 'int main() {}' > examples/zcrx.c
{% endblock %}
