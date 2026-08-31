{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_bash) and ix_boot_tool('bash') %}
bld/system/shim(tool_name={{ix_boot_tool('bash')}})
{% elif all_system or system_bash %}
{{ix.warn('bash not found in system, building from source')}}
bin/bash/lite(std_box=bld/system/box)
{% elif native %}
bin/bash/lite(std_box=bld/boot/box)
{% else %}
bin/bash/lite
{% endif %}
{% endblock %}
