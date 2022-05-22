{% extends '//die/make.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/libs/libcap/libcap.git/snapshot/libcap-cap/v1.2.64.tar.gz
sha:b2a9395b876844273e1c7f68c0bbc9ada2637fa585d2ae5c0e308b4840a3eaf4
{% endblock %}

{% block lib_deps %}
lib/c
lib/linux
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block unpack %}
{{super()}}
cd v*/libcap
{% endblock %}

{% block make_flags %}
SHARED=no
LIBDIR=${out}/lib
{% endblock %}
