{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/netwide-assembler/nasm/archive/refs/tags/nasm-2.15.05.tar.gz
2e154a96a13bf937d5247467d986bbde
{% endblock %}

{% block bld_tool %}
dev/lang/perl5/mix.sh
dev/build/autoconf/2/69/mix.sh
dev/build/automake/1.16.3/mix.sh
{% endblock %}

{% block autoreconf %}
dash autogen.sh
{% endblock %}

{% block patch %}
>nasm.1
>ndisasm.1
{% endblock %}
