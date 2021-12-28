{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/libmpack/libmpack/archive/refs/tags/1.0.5.tar.gz
ac4b25bfd0a07003ed8dac9c6dc851a6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block make_verbose %}
{% endblock %}

{% block make_verbose_1 %}
VERBOSE=1
OUTDIR=./
{% endblock %}

{% block bld_tool %}
dev/build/pkg-config
dev/build/auto/libtool
{% endblock %}
