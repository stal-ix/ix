{% extends '//boot/stage/8/bison/341/stage1/mix.sh' %}

{% block bison %}
# bld boot/stage/8/bison/341/stage1/mix.sh
{% endblock %}

{% block patch %}
rm src/parse-gram.c src/parse-gram.h
{% endblock %}
