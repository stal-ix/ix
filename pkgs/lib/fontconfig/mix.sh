{% extends '//lib/fontconfig/t/mix.sh' %}

{% block run_data %}
lib/fontconfig/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/scripts
{% endblock %}

{% block configure %}
{{super()}}
python3 $(which fix_data_dir.py) ${FONTCONFIG_DATA}
{% endblock %}
