{% extends '//die/c/make.sh' %}

{% block pkg_name %}
acpica
{% endblock %}

{% block version %}
20240827
{% endblock %}

{% block fetch %}
https://github.com/acpica/acpica/archive/refs/tags/version-{{self.version().strip()}}.tar.gz
sha:fe5b043d83521d489246c8e8f9a32aed24f9dfddf3e676453fe5d3bd0316a740
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
