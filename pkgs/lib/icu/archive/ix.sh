{% extends 't/ix.sh' %}

{% block use_data %}
lib/icu/archive/data
{% endblock %}

{% block cpp_defines %}
{{super()}}
ICU_DATA_DIR=\\\"${ICU_DATA}\\\"
{% endblock %}
