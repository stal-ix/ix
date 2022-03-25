{% extends '//lib/gtk/source/view/t/mix.sh' %}

{% block run_data %}
lib/gtk/source/view/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/scripts
{% endblock %}

{% block configure %}
{{super()}}
python3 $(which fix_data_dir.py) ${SOURCE_VIEW_DATA}
{% endblock %}
