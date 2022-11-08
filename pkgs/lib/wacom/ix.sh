{% extends '//lib/wacom/t/ix.sh' %}

{% block run_data %}
lib/wacom/data
{% endblock %}

{% block bld_data %}
lib/wacom/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/scripts/reloc
{% endblock %}

{% block configure %}
{{super()}}
relocate "${WACOM_DATA}"
{% endblock %}
