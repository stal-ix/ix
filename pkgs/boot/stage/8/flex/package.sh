{% extends '//dev/lang/flex/package.sh' %}

{% block deps %}
# bld boot/stage/7/lib/package.sh
# bld boot/stage/8/m4/package.sh
# bld boot/stage/4/make/package.sh
# bld boot/stage/4/byacc/package.sh
# bld boot/stage/6/env/clang/package.py
{% endblock %}

{% block patch %}
cd src

rm parse.c parse.h
yacc -d parse.y && mv y.tab.c parse.c && mv y.tab.h parse.h
echo 'extern int yylval;' >> parse.h
touch scan.c
{% endblock %}
