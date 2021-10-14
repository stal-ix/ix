{% extends '//boot/stage/8/bison/361/stage0/package.sh' %}

{% block bison %}
# bld boot/stage/8/bison/361/stage0
{% endblock %}

{% block patch %}
rm src/parse-gram.c src/parse-gram.h
{% endblock %}

{% block bison_cflags %}
{% endblock %}
