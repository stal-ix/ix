{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_tar) and ix_boot_tool('bsdtar') %}
bld/system/shim(tool_name={{ix_boot_tool('bsdtar')}})
bld/system/shim(tool_name={{ix_boot_tool('bsdcat')}})
{% elif all_system or system_tar %}
{{ix.warn('bsdtar not found in system, building from source')}}
bin/bsdtar(intl_ver=no,libc_lite=1)
{% elif native %}
bin/bsdtar/lite(std_box=bld/boot/box)
{% else %}
bin/bsdtar
{% endif %}
{% endblock %}
