{% extends '//die/c/make.sh' %}

{% block pkg_name %}
acpica
{% endblock %}

{% block version %}
20250404
{% endblock %}

{% block fetch %}
https://github.com/acpica/acpica/archive/refs/tags/R{{self.version().strip()[:4]}}_{{self.version().strip()[4:6]}}_{{self.version().strip()[6:]}}.tar.gz
sha:9991ec103b3660d17715780406ee7409f705cf87ac55e9a32374affe1a6f275a
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
