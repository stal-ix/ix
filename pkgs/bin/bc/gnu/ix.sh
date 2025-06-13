{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
bc
{% endblock %}

{% block version %}
1.08.2
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/bc/bc-{{self.version().strip()}}.tar.gz
ae470fec429775653e042015edc928d07c8c3b2fc59765172a330d3d87785f86
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
lib/readline
{% endblock %}

{% block bld_tool %}
bin/ed
bld/flex
bld/bash
bld/byacc
bld/texinfo
{% endblock %}

{% block make_no_thrs %}
{% endblock %}

{% block configure_flags %}
--with-readline
{% endblock %}

{% block patch %}
rm bc/scan.c bc/bc.c bc/bc.h
echo > "dc/-lreadline"
echo > "dc/-lncurses"
{% endblock %}
