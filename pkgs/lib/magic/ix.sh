{% extends '//lib/magic/t/ix.sh' %}

{% block run_data %}
aux/magic
{% endblock %}

{% block bld_data %}
aux/magic
{% endblock %}

{% block cpp_defines %}
MAGIC=\\\"${MAGIC_DATA}\\\"
{% endblock %}
