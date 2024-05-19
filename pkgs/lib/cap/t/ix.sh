{% extends '//die/c/make.sh' %}

{% block lib_deps %}
lib/c
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block make_flags %}
SHARED=no
LIBDIR=${out}/lib
{% endblock %}
