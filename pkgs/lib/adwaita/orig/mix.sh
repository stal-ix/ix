{% extends '//lib/adwaita/t/mix.sh' %}

{% block run_data %}
lib/adwaita/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/scripts
{% endblock %}

{% block configure %}
{{super()}}
python3 $(which fix_data_dir.py) "${ADWAITA_DATA}"
{% endblock %}
