{% extends '//die/c/make.sh' %}

{# 2.3 broken - conflict headers with linux #}

{% block fetch %}
https://github.com/axboe/liburing/archive/refs/tags/liburing-2.2.tar.gz
sha:e092624af6aa244ade2d52181cc07751ac5caba2f3d63e9240790db9ed130bbc
{% endblock %}

{% block lib_deps %}
lib/c
lib/kernel
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block configure %}
sh ./configure --prefix=${out}
{% endblock %}
