{% extends '//boot/stage/10/bison/361/stage0/mix.sh' %}

{% block bison %}
boot/stage/10/bison/361/stage0/mix.sh
{% endblock %}

{% block patch %}
rm src/parse-gram.c src/parse-gram.h
{% endblock %}

{% block bison_cflags %}
{% endblock %}
