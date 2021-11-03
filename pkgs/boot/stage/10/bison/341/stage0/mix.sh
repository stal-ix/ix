{% extends '//boot/stage/10/bison/341/template.sh' %}

{% block patch %}
rm src/parse-gram.*
cp bb/parse-gram.* src/
{% endblock %}

{% block postconf %}
{% endblock %}
