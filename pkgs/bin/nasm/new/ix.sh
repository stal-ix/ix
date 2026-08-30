{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nasm
{% endblock %}

{% block version %}
3.02
{% endblock %}

{% block fetch %}
https://github.com/netwide-assembler/nasm/archive/refs/tags/nasm-{{self.version().strip()}}.tar.gz
39e251d3048c9f68678903c6b05b83942c66c71e467e8c5c3c1b26cff2ef1586
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block build %}
{{super()}}
>nasm.1
>ndisasm.1
{% endblock %}

{% block c_flags %}
-Wno-keyword-macro
{% endblock %}

{% block patch %}
sed -e 's|ifdef bool|ifdef xxx|' \
    -e 's|.*typedef enum bool.*||' \
    -i include/compiler.h
{% endblock %}
