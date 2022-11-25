{% extends '//lib/alsa/t/ix.sh' %}

{% block use_data %}
lib/alsa/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/reloc
{% endblock %}

{% block configure %}
{{super()}}
relocate "${ALSA_LIB_DATA}"
{% endblock %}
