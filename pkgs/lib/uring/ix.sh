{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/axboe/liburing/archive/refs/tags/liburing-2.7.tar.gz
sha:56202ad443c50e684dde3692819be3b91bbe003e1c14bf5abfa11973669978c1
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
