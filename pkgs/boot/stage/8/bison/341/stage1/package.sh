{% extends '//boot/stage/8/bison/341/template.sh' %}

{% block bison %}
# bld boot/stage/8/bison/341/stage0
{% endblock %}

{% block patch %}
rm src/parse-gram.*
cp bb/parse-gram.y src/
{% endblock %}
