{% extends '//die/c/make.sh' %}

{% block pkg_name %}
acpica
{% endblock %}

{% block version %}
20251212
{% endblock %}

{% block fetch %}
https://github.com/acpica/acpica/archive/refs/tags/{{self.version().strip()}}.tar.gz
6f77bd550655183c63f0a307fb0f29ef6140b1f522d61783a16b2af8d9149a0d
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
