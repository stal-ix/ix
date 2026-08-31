{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
unbound
{% endblock %}

{% block version %}
1.26.0
{% endblock %}

{% block fetch %}
https://github.com/NLnetLabs/unbound/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
2a2953a2349fd79b4aa245e2c246da781804f377010dd168f06d2eb2dc79a9a0
{% endblock %}

{% block lib_deps %}
lib/c
lib/expat
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}
