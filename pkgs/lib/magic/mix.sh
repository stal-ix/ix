{% extends '//lib/magic/t/mix.sh' %}

{% block run_data %}
aux/magic
{% endblock %}

{% block cpp_defines %}
MAGIC=\\\"${MAGIC_DATA}\\\"
{% endblock %}
