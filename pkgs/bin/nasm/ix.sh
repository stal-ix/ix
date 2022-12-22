{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/netwide-assembler/nasm/archive/refs/tags/nasm-2.16.01.tar.gz
sha:d4a9c2b806e736cac8e9ad891b3cc042f4d7d20f764432e128d613cb1a4f0189
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
