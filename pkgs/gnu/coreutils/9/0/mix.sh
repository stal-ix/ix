{% extends '//gnu/coreutils/template/mix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-9.0.tar.xz
0d79ae8a6124546e3b94171375e5e5d0
{% endblock %}

{% block bld_libs %}
lib/c
lib/gmp
lib/openssl/1

{% if target.os == 'linux' %}
lib/acl
lib/cap
lib/attr
{% endif %}

{{super()}}
{% endblock %}

{% block bld_tool %}
dev/lang/bison/3/7
dev/tool/perl
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-openssl=yes
{% endblock %}

{% block configure %}
{{super()}}
cat Makefile | grep -v 'LIBINTL = ' > _ && mv _ Makefile
{% endblock %}
