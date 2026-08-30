{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_gzip) and ix_boot_tool('gzip') %}
bld/system/shim(tool_name={{ix_boot_tool('gzip')}})
{% elif all_system or system_gzip %}
{{ix.warn('gzip not found in system, building from source')}}
bin/minigzip/gzip(std_box=bld/system/box)
{% elif native %}
bin/minigzip/gzip(std_box=bld/boot/box)
{% else %}
bin/minigzip/gzip
{% endif %}
{% endblock %}
