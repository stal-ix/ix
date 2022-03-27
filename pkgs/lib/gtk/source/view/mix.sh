{% extends '//lib/gtk/source/view/t/mix.sh' %}

{% block run_data %}
lib/gtk/source/view/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/scripts/reloc
{% endblock %}

{% block configure %}
{{super()}}
relocate "${SOURCE_VIEW_DATA}"
{% endblock %}
