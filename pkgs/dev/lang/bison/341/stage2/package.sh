{% extends '//dev/lang/bison/341/stage1/package.sh' %}

{% block bison %}
# bld dev/lang/bison/341/stage1
{% endblock %}

{% block patch %}
rm src/parse-gram.c src/parse-gram.h
{% endblock %}
