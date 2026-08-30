{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_pkg_config) and ix_boot_tool('pkg-config') %}
bld/system/shim(tool_name={{ix_boot_tool('pkg-config')}})
{% elif all_system or system_pkg_config %}
{{ix.warn('pkg-config not found in system, building from source')}}
bin/pkg/config(std_box=bld/system/box,intl_ver=stub,libglib_ver=host)
{% elif native %}
bin/pkg/config(std_box=bld/boot/box,intl_ver=stub,libglib_ver=host)
{% else %}
bin/pkg/config(intl_ver=stub)
{% endif %}
{% endblock %}
