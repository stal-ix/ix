{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libmpack
{% endblock %}

{% block version %}
1.0.5
{% endblock %}

{% block fetch %}
https://github.com/libmpack/libmpack/archive/refs/tags/{{self.version().strip()}}.tar.gz
4ce91395d81ccea97d3ad4cb962f8540d166e59d3e2ddce8a22979b49f108956
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
