{% extends '//die/c/make.sh' %}

{% block pkg_name %}
acpica
{% endblock %}

{% block version %}
R2025_04_04
{% endblock %}

{% block fetch %}
https://github.com/acpica/acpica/archive/refs/tags/{{self.version().strip()}}.tar.gz
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
