{% extends '//die/c/make.sh' %}

{% block pkg_name %}
liburing
{% endblock %}

{% block version %}
2.9
{% endblock %}

{% block fetch %}
https://github.com/axboe/liburing/archive/refs/tags/liburing-{{self.version().strip()}}.tar.gz
sha:897b1153b55543e8b92a5a3eb9b906537a5fedcf8afaf241f8b8787940c79f8d
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
