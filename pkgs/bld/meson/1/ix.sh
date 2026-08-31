{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_meson) and ix_boot_tool('meson') %}
bld/system/shim(tool_name={{ix_boot_tool('meson')}})
{% else %}
bld/cmake
bld/python
{% if all_system or system_meson %}
{{ix.warn('meson not found in system, building from source')}}
bld/meson/unwrap(std_box=bld/system/box)
{% elif native %}
bld/meson/unwrap(std_box=bld/boot/box)
{% else %}
bld/meson/unwrap
{% endif %}
{% endif %}
{% endblock %}
