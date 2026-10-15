{% extends '//die/c/make.sh' %}

{% block pkg_name %}
acpica
{% endblock %}

{% block version %}
20260930
{% endblock %}

{% block fetch %}
https://github.com/acpica/acpica/archive/refs/tags/{{self.version().strip()}}.tar.gz
feddab0f42f1e01afa3b8ec04f3aaef5e61e891225b8dc8776953ca9f3df1449
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
