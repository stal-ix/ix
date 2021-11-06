{% extends '//boot/9/bison/3.4.1_t.sh' %}

{% block bison_patch %}
cp bb/parse-gram.* src/
{% endblock %}

{% block postconf %}
{% endblock %}
