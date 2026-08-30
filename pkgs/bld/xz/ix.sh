{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_xz) and ix_boot_tool('xz') %}
bld/system/shim(tool_name={{ix_boot_tool('xz')}})
{% elif all_system or system_xz %}
{{ix.warn('xz not found in system, building from source')}}
bin/xz(std_box=bld/system/box,intl_ver=no)
{% elif native %}
bin/xz(std_box=bld/boot/box,intl_ver=no)
{% else %}
bin/xz(intl_ver=no)
{% endif %}
{% endblock %}
