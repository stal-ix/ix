{% extends '//dev/lang/flex/mix.sh' %}

{% block run_deps %}
boot/9/m4/mix.sh
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
{% block boot_flex %}
boot/9/flex/2.5.10.1.sh
boot/4/byacc/mix.sh
{% endblock %}
boot/9/m4/mix.sh
boot/8/env/std/mix.sh
{% endblock %}

{% block patch %}
cd src && rm parse.c parse.h scan.c skel.c
{% endblock %}

{% block prebuild %}
(
    set -eu

    cd src

    byacc -d parse.y && mv y.tab.c parse.c && mv y.tab.h parse.h
    echo 'extern int yylval;' >> parse.h
)
{% endblock %}
