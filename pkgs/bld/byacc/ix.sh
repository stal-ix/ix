{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_byacc) and ix_boot_tool('yacc') %}
bld/system/shim(tool_name={{ix_boot_tool('yacc')}})
{% elif all_system or system_byacc %}
{{ix.warn('yacc not found in system, building from source')}}
bin/byacc/yacc(std_box=bld/system/box,intl_ver=no)
{% elif native %}
bin/byacc/yacc(std_box=bld/boot/box,intl_ver=no)
{% else %}
bin/byacc/yacc(intl_ver=no)
{% endif %}
{% endblock %}
