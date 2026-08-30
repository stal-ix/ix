{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_meson) and ix_boot_tool('meson') %}
bld/system/shim(tool_name={{ix_boot_tool('meson')}})
{% else %}
{% if all_system or system_meson %}
{{ix.warn('meson not found in system, building from source')}}
{% endif %}
bld/cmake
bld/python
bin/meson/1/9
bld/pkg/config
{% endif %}
{% endblock %}
