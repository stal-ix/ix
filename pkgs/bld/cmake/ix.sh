{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_cmake) and ix_boot_tool('cmake') %}
bld/system/shim(tool_name={{ix_boot_tool('cmake')}})
{% elif all_system or system_cmake %}
{{ix.warn('cmake not found in system, building from source')}}
bin/cmake/lite(std_box=bld/system/box,intl_ver=no)
{% elif native %}
bin/cmake/lite(std_box=bld/boot/box,intl_ver=no)
{% else %}
bin/cmake/lite(intl_ver=no)
{% endif %}
{% endblock %}
