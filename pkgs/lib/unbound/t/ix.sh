{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
unbound
{% endblock %}

{% block version %}
1.24.0
{% endblock %}

{% block fetch %}
https://github.com/NLnetLabs/unbound/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
7d7832b9b948d95b6751dce392806814d427b3ed64efc2ec863f486dec26d759
{% endblock %}

{% block lib_deps %}
lib/c
lib/expat
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}
