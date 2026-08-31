{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_texinfo) and ix_boot_tool('makeinfo') %}
bld/system/shim(tool_name={{ix_boot_tool('makeinfo')}})
{% elif all_system or system_texinfo %}
{{ix.warn('makeinfo not found in system, building from source')}}
bld/texinfo/unwrap(std_box=bld/system/box)
{% elif native %}
bld/texinfo/unwrap(std_box=bld/boot/box)
{% else %}
bld/texinfo/unwrap
{% endif %}
{% endblock %}
