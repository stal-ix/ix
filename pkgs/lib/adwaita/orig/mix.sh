{% extends '//lib/adwaita/t/mix.sh' %}

{% block run_data %}
lib/adwaita/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/scripts/reloc
{% endblock %}

{% block configure %}
{{super()}}
relocate "${ADWAITA_DATA}"
{% endblock %}
