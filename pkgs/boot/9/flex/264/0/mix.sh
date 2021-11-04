{% extends '//dev/lang/flex/mix.sh' %}

{% block lib_deps %}
boot/9/m4/mix.sh
{% endblock %}

{% block bld_deps %}
{% block boot_flex %}
boot/9/flex/2510/1/mix.sh
boot/4/byacc/mix.sh
{% endblock %}
boot/8/env/std/mix.sh
{% endblock %}

{% block patch %}
cd src

rm parse.c parse.h scan.c skel.c
byacc -d parse.y && mv y.tab.c parse.c && mv y.tab.h parse.h
echo 'extern int yylval;' >> parse.h
{% endblock %}
