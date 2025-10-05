{% extends '//die/c/make.sh' %}

{% block pkg_name %}
acpica
{% endblock %}

{% block version %}
20250807
{% endblock %}

{% block fetch %}
https://github.com/acpica/acpica/archive/refs/tags/{{self.version().strip()}}.tar.gz
971df1f78944e5f3bb314209acbf8a127c0db34b4a3c26e011b4076eba1c2bbc
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
