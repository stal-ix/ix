{% extends '//die/c/make.sh' %}

{% block pkg_name %}
liburing
{% endblock %}

{% block version %}
2.11
{% endblock %}

{% block fetch %}
https://github.com/axboe/liburing/archive/refs/tags/liburing-{{self.version().strip()}}.tar.gz
462c35ef21d67e50490f8684c76641ee2c7796e83d43de796852ef4e40662e33
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
