{% extends '//die/c/make.sh' %}

{% block pkg_name %}
liburing
{% endblock %}

{% block version %}
2.15
{% endblock %}

{% block fetch %}
https://github.com/axboe/liburing/archive/refs/tags/liburing-{{self.version().strip()}}.tar.gz
8d052f2622dcb3678cbaee5ff582a87572672a6c0a56533cdda5b65cb636120a
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

{% block make_target %}
library
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
