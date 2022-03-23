{% extends '//lib/drm/t/mix.sh' %}

{% block run_data %}
lib/drm/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/scripts
{% endblock %}

{% block c_rename_symbol %}
handle_table_remove
{{super()}}
{% endblock %}

{% block configure %}
{{super()}}
python3 $(which fix_data_dir.py) ${DRM_DATA}
{% endblock %}
