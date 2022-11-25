{% extends 't/ix.sh' %}

{% block use_data %}
lib/input/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/reloc
{% endblock %}

{% block configure %}
{{super()}}
relocate "${INPUT_DATA}"
{% endblock %}

{% block meson_flags %}
debug-gui=false
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/lib/lib_* ${out}/lib/udev
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
list_init
list_insert
list_append
list_remove
list_empty
{% endblock %}
