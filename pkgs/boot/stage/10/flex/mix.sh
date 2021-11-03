{% extends '//dev/lang/flex/mix.sh' %}

{% block lib_deps %}
boot/stage/10/m4/mix.sh
{% endblock %}

{% block bld_deps %}
boot/stage/9/lib/mix.sh
boot/stage/4/byacc/mix.sh
boot/stage/8/env/mix.sh
{% endblock %}

{% block patch %}
cd src

rm parse.c parse.h
yacc -d parse.y && mv y.tab.c parse.c && mv y.tab.h parse.h
echo 'extern int yylval;' >> parse.h
touch scan.c
{% endblock %}
