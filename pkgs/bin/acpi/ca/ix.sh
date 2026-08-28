{% extends '//die/c/make.sh' %}

{% block pkg_name %}
acpica
{% endblock %}

{% block version %}
20260408
{% endblock %}

{% block fetch %}
https://github.com/acpica/acpica/archive/refs/tags/{{self.version().strip()}}.tar.gz
ddc5d3e0f54030e2348484fff681861a161efb4e388e20631209574e7884ad39
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}
