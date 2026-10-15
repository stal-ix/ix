{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_nasm) and ix_boot_tool('nasm') %}
bld/system/shim(tool_name={{ix_boot_tool('nasm')}})
{% elif all_system or system_nasm %}
{{ix.warn('nasm not found in system, building from source')}}
bin/nasm(std_box=bld/system/box,libc_lite=1)
{% else %}
bin/nasm(std_box=bld/boot/box)
{% endif %}
{% endblock %}
