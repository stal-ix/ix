{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/libmpack/libmpack/archive/refs/tags/1.0.5.tar.gz
ac4b25bfd0a07003ed8dac9c6dc851a6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block make_flags %}
OUTDIR=./
{% endblock %}

{% block bld_tool %}
bld/libtool
bld/pkg/config
{% endblock %}
