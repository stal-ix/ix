{% extends '//lib/input/t/mix.sh' %}

{% block run_data %}
lib/input/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/scripts
{% endblock %}

{% block configure %}
{{super()}}
python3 $(which fix_data_dir.py) ${INPUT_DATA}
{% endblock %}

{% block meson_flags %}
debug-gui=false
{{super()}}
{% endblock %}
