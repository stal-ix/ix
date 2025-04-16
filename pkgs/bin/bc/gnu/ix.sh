{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
bc
{% endblock %}

{% block version %}
1.08.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/bc/bc-{{self.version().strip()}}.tar.gz
sha:b71457ffeb210d7ea61825ff72b3e49dc8f2c1a04102bbe23591d783d1bfe996
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
