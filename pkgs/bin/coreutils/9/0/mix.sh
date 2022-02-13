{% extends '//bin/coreutils/t/mix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-9.0.tar.xz
0d79ae8a6124546e3b94171375e5e5d0
{% endblock %}

{% block bld_libs %}
lib/c
lib/gmp
lib/openssl/1

{% if linux %}
lib/acl
lib/cap
lib/attr
{% endif %}

{{super()}}
{% endblock %}

{% block bld_tool %}
bin/bison/3/7
bld/perl
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-openssl=yes
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|.*LIBINTL = .*||' -i Makefile
{% endblock %}
