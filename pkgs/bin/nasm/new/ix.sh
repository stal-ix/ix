{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nasm
{% endblock %}

{% block version %}
3.01
{% endblock %}

{% block fetch %}
https://github.com/netwide-assembler/nasm/archive/refs/tags/nasm-{{self.version().strip()}}.tar.gz
af2f241ecc061205d73ba4f781f075d025dabaeab020b676b7db144bf7015d6d
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
