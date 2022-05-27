{% extends '//die/autohell.sh' %}

{% block make_no_thrs %}{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.xz
d61aa92e3562cb7292b004ce96173cf7
{% endblock %}

{% block run_deps %}
bld/m4
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block bld_tool %}
bld/perl
bld/texinfo
bld/help2man
{% endblock %}

{% block std_box %}
bld/m4
bld/flex
{% block bison_bootstrap %}
bld/bison
{% endblock %}
{{super()}}
{% endblock %}

{% block configure_flags %}
--enable-relocatable
{% endblock %}

{% block c_rename_symbol %}
error
accept
error_at_line
error_one_per_line
error_message_count
error_print_progname
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|/.*/bin/m4|m4|' -i Makefile
sed -e 's|/.*/bin/m4|m4|' -i lib/config.h
rm tests/bison
ln -s $(which bison) tests/
{% endblock %}

{% block patch %}
rm src/parse-gram.c src/parse-gram.h
{% endblock %}

{% block env %}
export YACC="${out}/bin/yacc"
export YFLAGS=-Wnone
{% endblock %}
