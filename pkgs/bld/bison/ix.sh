{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_bison) and ix_boot_tool('bison') %}
bld/system/shim(tool_name={{ix_boot_tool('bison')}})
{% else %}
bld/m4
{% if all_system or system_bison %}
{{ix.warn('bison not found in system, building from source')}}
bin/bison/3/7(std_box=bld/system/box,intl_ver=no)
{% elif native %}
bin/bison/3/7(std_box=bld/boot/box,intl_ver=no)
{% else %}
bin/bison/3/7(intl_ver=no)
{% endif %}
{% endif %}
{% endblock %}
