{% extends '//lib/icu/t/ix.sh' %}

{% block run_data %}
lib/icu/data
{% endblock %}

{% block cpp_defines %}
{{super()}}
ICU_DATA_DIR=\\\"${ICU_DATA}\\\"
{% endblock %}
