{% extends '//lib/alsa/t/ix.sh' %}

{% block run_data %}
lib/alsa/data
{% endblock %}

{% block bld_data %}
lib/alsa/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/scripts/reloc
{% endblock %}

{% block configure %}
{{super()}}
relocate "${ALSA_LIB_DATA}"
{% endblock %}
