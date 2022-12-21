{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/netwide-assembler/nasm/archive/refs/tags/nasm-2.16.tar.gz
sha:b59da6ef9bfeaf35572398f065848991485ea5e9583b9e88365c3e941e9e5214
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block autoreconf %}
sh autogen.sh
{% endblock %}

{% block patch %}
>nasm.1
>ndisasm.1
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
