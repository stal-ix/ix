{% extends '//bld/boot/10/bison/0/t/ix.sh' %}

{% block bison %}
bld/boot/10/bison/0
{% endblock %}

{% block bison_patch %}
cp bb/parse-gram.y src/
{% endblock %}
