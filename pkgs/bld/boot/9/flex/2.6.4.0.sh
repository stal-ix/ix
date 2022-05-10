{% extends '//bin/flex/mix.sh' %}

{% block run_deps %}
bld/boot/9/m4
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
{% block boot_flex %}
bld/boot/9/flex/2.5.10.1.sh
bld/boot/4/byacc
{% endblock %}
bld/boot/9/m4
bld/boot/8/env/std
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
