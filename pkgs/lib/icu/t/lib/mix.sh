{% extends '//lib/icu/t/mix.sh' %}

{% block run_data %}
lib/icu/data
{% endblock %}

{% block cpp_defines %}
{{super()}}
ICU_DATA_DIR=\\\"${ICU_DATA}\\\"
{% endblock %}
