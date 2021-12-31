{% extends '//lib/drm/t/mix.sh' %}

{% block run_data %}
lib/drm/data
{% endblock %}

{% block bld_tool %}
{{super()}}
dev/tool/scripts
{% endblock %}

{% block configure %}
{{super()}}
python3 $(which reparent.py) ${out} ${DRM_DATA} ${tmp}
{% endblock %}
