{% extends '//lib/input/t/mix.sh' %}

{% block run_data %}
lib/input/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/scripts/reloc
{% endblock %}

{% block configure %}
{{super()}}
relocate "${INPUT_DATA}"
{% endblock %}

{% block meson_flags %}
debug-gui=false
{{super()}}
{% endblock %}
