{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_m4) and ix_boot_tool('m4') %}
bld/system/shim(tool_name={{ix_boot_tool('m4')}})
{% elif all_system or system_m4 %}
{{ix.warn('m4 not found in system, building from source')}}
bin/m4/19(std_box=bld/system/box,intl_ver=no)
{% elif native %}
bin/m4/19(std_box=bld/boot/box,intl_ver=no)
{% else %}
bin/m4/19(intl_ver=no)
{% endif %}
{% endblock %}
