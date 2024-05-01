{% extends '//die/c/make.sh' %}

{# 2.3 broken - conflict headers with linux #}

{% block fetch %}
https://github.com/axboe/liburing/archive/refs/tags/liburing-2.6.tar.gz
sha:682f06733e6db6402c1f904cbbe12b94942a49effc872c9e01db3d7b180917cc
{% endblock %}

{% block lib_deps %}
lib/c
lib/kernel
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
