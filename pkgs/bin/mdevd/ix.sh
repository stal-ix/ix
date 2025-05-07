{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
mdevd
{% endblock %}

{% block version %}
0.1.7.0
{% endblock %}

{% block fetch %}
https://github.com/skarnet/mdevd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:55596f1702207093dd59a3aee4ba68c5e53e08335c27ec6f18444aaf5231679a
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/skalibs
{% endblock %}

{% block make_flags %}
{{super()}}
VPATH=${MAKE_VPATH}
{% endblock %}
