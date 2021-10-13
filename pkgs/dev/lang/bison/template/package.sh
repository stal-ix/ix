{% extends '//mix/template/autohell.sh' %}

{% block deps %}
# bld lib/intl
# lib dev/lang/m4
# bld dev/lang/flex dev/lang/perl5 dev/build/make
# bld dev/build/help2man dev/doc/texinfo env/std
{% block bison %}
{% endblock %}
{% endblock %}

{% block coflags %}
--enable-relocatable
{% endblock %}

{% block build %}
make
{% endblock %}

{% block env %}
export YACC="${out}/bin/bison"
{% endblock %}

{% block test %}
${out}/bin/bison --help
{% endblock %}

{% block postconf %}
rm tests/bison
ln -s $(which bison) tests/
{% endblock %}

{% block cflags %}
export CPPFLAGS="-Derror=b_error -Derror_at_line=b_error_at_line -Derror_message_count=b_error_message_count -Derror_one_per_line=b_error_one_per_line -Derror_print_progname=b_error_print_progname ${CPPFLAGS}"
{% block bison_cflags %}
{% endblock %}
{% endblock %}
