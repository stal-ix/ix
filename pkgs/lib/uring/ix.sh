{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/axboe/liburing/archive/refs/tags/liburing-2.1.tar.gz
sha:f1e0500cb3934b0b61c5020c3999a973c9c93b618faff1eba75aadc95bb03e07
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block configure %}
sh ./configure --prefix=${out}
{% endblock %}
