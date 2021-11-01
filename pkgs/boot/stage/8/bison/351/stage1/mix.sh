{% extends '//boot/stage/8/bison/351/stage0/mix.sh' %}

{% block bison %}
boot/stage/8/bison/351/stage0/mix.sh
{% endblock %}

{% block patch %}
rm src/parse-gram.c src/parse-gram.h
{% endblock %}
