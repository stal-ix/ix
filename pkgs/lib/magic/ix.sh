{% extends '//lib/magic/t/ix.sh' %}

{% block use_data %}
aux/magic
{% endblock %}

{% block cpp_defines %}
MAGIC=\\\"${MAGIC_DATA}\\\"
{% endblock %}
