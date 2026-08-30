{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_python) and ix_boot_tool('python3') %}
bld/system/shim(tool_name={{ix_boot_tool('python3')}})
{% elif all_system or system_python %}
{{ix.warn('python3 not found in system, building from source')}}
bin/python/lite(std_box=bld/system/box,intl_ver=no)
{% elif native %}
bin/python/lite(std_box=bld/boot/box,intl_ver=no)
{% else %}
bin/python/12(intl_ver=no)
{% endif %}
{% endblock %}
