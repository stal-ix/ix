{% extends '//lib/fontconfig/t/mix.sh' %}

{% block run_data %}
lib/fontconfig/data
{% endblock %}

{% block bld_tool %}
{{super()}}
dev/tool/scripts
{% endblock %}

{% block configure %}
{{super()}}
python3 $(which reparent.py) ${out} ${FONTCONFIG_DATA} ${tmp}
{% endblock %}

{% block install %}
{{super()}}
# ensure it will not be used
rm -rf ${out}/var ${out}/share
{% endblock %}
