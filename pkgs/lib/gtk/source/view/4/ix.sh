{% extends 't/ix.sh' %}

{% block use_data %}
lib/gtk/source/view/4/data
{% endblock %}

{% block meson_flags %}
{{super()}}
gir=false
vapi=false
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/reloc
{% endblock %}

{% block configure %}
{{super()}}
relocate "${SOURCE_VIEW_DATA}"
{% endblock %}
