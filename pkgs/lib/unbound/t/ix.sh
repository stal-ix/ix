{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
unbound
{% endblock %}

{% block version %}
1.26.2
{% endblock %}

{% block fetch %}
https://github.com/NLnetLabs/unbound/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
4ec94f911afb4347600d6b1044264fe8e9b07d73c6fcba668ace5a0cf45803d5
{% endblock %}

{% block lib_deps %}
lib/c
lib/expat
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}
