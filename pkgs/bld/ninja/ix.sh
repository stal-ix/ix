{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_ninja) and ix_boot_tool('ninja') %}
bld/system/shim(tool_name={{ix_boot_tool('ninja')}})
{% elif all_system or system_ninja %}
{{ix.warn('ninja not found in system, building from source')}}
bin/ninja(std_box=bld/system/box)
{% elif native %}
bin/ninja(std_box=bld/boot/box)
{% else %}
bin/ninja
{% endif %}
{% endblock %}
