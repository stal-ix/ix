{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.lz
# md5 a04b480d7455f0f5bdc6d36959e08e4c
{% endblock %}

{% block deps %}
# bld dev/lang/m4 dev/lang/byacc dev/build/make env/std
{% endblock %}

{% block patch %}
cd src

rm parse.c parse.h
yacc -d parse.y && mv y.tab.c parse.c && mv y.tab.h parse.h
echo 'extern int yylval;' >> parse.h
{% endblock %}
