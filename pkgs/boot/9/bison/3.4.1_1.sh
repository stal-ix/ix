{% extends '//boot/9/bison/341/template.sh' %}

{% block bison %}
boot/9/bison/3.4.1_0.sh
{% endblock %}

{% block bison_patch %}
cp bb/parse-gram.y src/
{% endblock %}
