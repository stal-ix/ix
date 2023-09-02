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

{% block patch %}
{{super()}}
sed -e 's|ifndef PIC|if 1|' -i src/dlmisc.c
{% endblock %}
