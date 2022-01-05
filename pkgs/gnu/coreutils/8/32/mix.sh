{% extends '//gnu/coreutils/t/mix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-8.32.tar.xz
022042695b7d5bcf1a93559a9735e668
{% endblock %}

{% block bld_tool %}
boot/9/bison/3.4.1_2.sh
{{super()}}
{% endblock %}

{% block configure %}
{{super()}}
cat Makefile | grep -v 'LIBINTL = -lintl' > _ && mv _ Makefile
{% endblock %}

{% block configure_flags %}
{{super()}}
--without-gmp
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
