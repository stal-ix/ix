{% extends '//boot/stage/8/bison/351/stage0/package.sh' %}

{% block bison %}
# bld boot/stage/8/bison/351/stage0/package.sh
{% endblock %}

{% block patch %}
rm src/parse-gram.c src/parse-gram.h
{% endblock %}
