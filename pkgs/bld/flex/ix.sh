{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_flex) and ix_boot_tool('flex') %}
bld/system/shim(tool_name={{ix_boot_tool('flex')}})
{% else %}
bld/m4
{% if all_system or system_flex %}
{{ix.warn('flex not found in system, building from source')}}
bld/flex/native(std_box=bld/system/box,intl_ver=no)
{% elif native %}
bld/flex/native(std_box=bld/boot/box,intl_ver=no)
{% else %}
bin/flex(intl_ver=no)
{% endif %}
{% endif %}
{% endblock %}
