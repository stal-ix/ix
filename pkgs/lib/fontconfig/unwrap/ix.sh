{% extends '//lib/fontconfig/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/freetype/bootstrap
{% endblock %}

{% block use_data %}
lib/fontconfig/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/reloc
{% endblock %}

{% block configure %}
{{super()}}
relocate "${FONTCONFIG_DATA}"
{% endblock %}
