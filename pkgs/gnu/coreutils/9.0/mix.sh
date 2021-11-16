{% extends '//gnu/coreutils/template/mix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-9.0.tar.xz
0d79ae8a6124546e3b94171375e5e5d0
{% endblock %}

{% block bld_libs %}
lib/openssl/mix.sh
lib/gmp/mix.sh
{{super()}}
{% endblock %}

{% block bld_tool %}
dev/lang/bison/3.7.6/mix.sh
dev/lang/perl5/mix.sh
{{super()}}
{% endblock %}

{% block coflags %}
{{super()}}
--with-openssl=yes
{% endblock %}

{% block configure %}
{{super()}}
cat Makefile | grep -v 'LIBINTL = ' > _ && mv _ Makefile
{% endblock %}
