{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/bc/bc-1.07.1.tar.gz
sha:62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
lib/readline
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bash
bld/byacc
bld/texinfo
bin/heirloom/ed
{% endblock %}

{% block make_no_thrs %}
{% endblock %}

{% block configure_flags %}
--with-readline
{% endblock %}

{% block patch %}
rm bc/scan.c bc/bc.c bc/bc.h
{% endblock %}
