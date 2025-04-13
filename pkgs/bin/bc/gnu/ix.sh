{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
bc
{% endblock %}

{% block version %}
1.08.0
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/bc/bc-{{self.version().strip()}}.tar.gz
sha:7db49996cbe16d7602936fef586e69e492c3df65765c0a891841025a1ad741ef
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
