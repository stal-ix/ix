{% extends '//boot/9/flex/264/0/mix.sh' %}

{% block boot_flex %}
boot/9/flex/264/1/mix.sh
boot/9/bison/376/stage1/mix.sh
{% endblock %}

{% block patch %}
cd src && rm parse.c parse.h scan.c skel.c
{% endblock %}
