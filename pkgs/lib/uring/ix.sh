{% extends '//die/c/make.sh' %}

{% block pkg_name %}
liburing
{% endblock %}

{% block version %}
2.10
{% endblock %}

{% block fetch %}
https://github.com/axboe/liburing/archive/refs/tags/liburing-{{self.version().strip()}}.tar.gz
sha:0a687616a6886cd82b746b79c4e33dc40b8d7c0c6e24d0f6f3fd7cf41886bf53
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
