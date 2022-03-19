{% extends '//lib/alsa/lib/t/mix.sh' %}

{% block run_data %}
lib/alsa/lib/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/scripts
{% endblock %}

{% block configure %}
{{super()}}
python3 $(which fix_data_dir.py) "${ALSA_LIB_DATA}"
{% endblock %}
