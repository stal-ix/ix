{% extends '//mix/template/autohell.sh' %}

{% block make_thrs %}1{% endblock %}

{% block coflags %}
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

{% block postconf %}
rm tests/bison
ln -s $(command -v bison) tests/
{% endblock %}

{% block patch %}
rm src/parse-gram.c src/parse-gram.h

{% block bison_patch %}
{% endblock %}
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/lib ${out}/include
{% endblock %}
