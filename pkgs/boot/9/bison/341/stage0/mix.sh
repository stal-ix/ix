{% extends '//boot/9/bison/341/template.sh' %}

{% block sh_script_begin %}
set -x
{% endblock %}

{% block bison_patch %}
cp bb/parse-gram.* src/
{% endblock %}

{% block postconf %}
{% endblock %}
