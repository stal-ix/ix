{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_make) and ix_boot_tool('make') %}
bld/system/shim(tool_name={{ix_boot_tool('make')}})
{% elif all_system or system_make %}
{{ix.warn('make not found in system, building from source')}}
bin/make/lite(std_box=bld/system/box,intl_ver=no)
{% elif native %}
bin/make/lite(std_box=bld/boot/box,intl_ver=no)
{% else %}
bin/make(intl_ver=no)
{% endif %}
{% endblock %}
