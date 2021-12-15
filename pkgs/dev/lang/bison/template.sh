{% extends '//mix/template/autohell.sh' %}

{% block make_no_thrs %}{% endblock %}

{% block configure_flags %}
--enable-relocatable
{% endblock %}

{% block env %}
export YACC="${out}/bin/bison"
export YFLAGS=-Wnone
{% endblock %}

{% block setup %}
export CPPFLAGS="-Derror=b_error -Derror_at_line=b_error_at_line -Derror_message_count=b_error_message_count -Derror_one_per_line=b_error_one_per_line -Derror_print_progname=b_error_print_progname ${CPPFLAGS}"
{% block bison_cflags %}
{% endblock %}
{% endblock %}

{% block configure %}
{{super()}}

{% block bison_postconf %}
rm tests/bison
ln -s $(which bison) tests/
{% endblock %}
{% endblock %}

{% block patch %}
rm src/parse-gram.c src/parse-gram.h

{% block bison_patch %}
{% endblock %}
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
{% endblock %}
