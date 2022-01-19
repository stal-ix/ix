{% extends '//bin/flex/mix.sh' %}

{% block run_deps %}
boot/9/m4
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
{% block boot_flex %}
boot/9/flex/2.5.10.1.sh
boot/4/byacc
{% endblock %}
boot/9/m4
boot/8/env/std
{% endblock %}

{% block patch %}
cd src && rm parse.c parse.h scan.c skel.c
{% endblock %}

{% block build %}
{% block flex_prebuild %}
(

    cd src

    byacc -d parse.y && mv y.tab.c parse.c && mv y.tab.h parse.h
    echo 'extern int yylval;' >> parse.h
)
{% endblock %}

{{super()}}
{% endblock %}
