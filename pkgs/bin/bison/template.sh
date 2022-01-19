{% extends '//mix/template/autohell.sh' %}

{% block make_no_thrs %}{% endblock %}

{% block configure_flags %}
--enable-relocatable
{% endblock %}

{% block env %}
export YACC="${out}/bin/bison"
export YFLAGS=-Wnone
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
lib/c
{% endblock %}
