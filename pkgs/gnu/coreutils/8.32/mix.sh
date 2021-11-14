{% extends '//gnu/coreutils/template/mix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-8.32.tar.xz
022042695b7d5bcf1a93559a9735e668
{% endblock %}

{% block coreutils_deps_extra %}
boot/9/bison/3.4.1_2.sh
{% endblock %}

{% block postconf %}
cat Makefile | grep -v 'LIBINTL = -lintl' > _ && mv _ Makefile
{% endblock %}
