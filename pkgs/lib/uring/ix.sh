{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/axboe/liburing/archive/refs/tags/liburing-2.8.tar.gz
sha:3ed7891d1b2bbe743ef3fb6d0a4970e630aa02d7c7bd3b0212791fb7be815984
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
