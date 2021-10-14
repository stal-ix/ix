{% extends '//dev/lang/flex/package.sh' %}

{% block deps %}
# bld boot/stage/7/lib
# bld boot/stage/8/m4 boot/stage/4/make boot/stage/4/byacc boot/stage/6/env/clang
{% endblock %}

{% block patch %}
cd src

rm parse.c parse.h
yacc -d parse.y && mv y.tab.c parse.c && mv y.tab.h parse.h
echo 'extern int yylval;' >> parse.h
touch scan.c
{% endblock %}
