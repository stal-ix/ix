{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_perl) and ix_boot_tool('perl') %}
bld/system/shim(tool_name={{ix_boot_tool('perl')}})
{% elif all_system or system_perl %}
{{ix.warn('perl not found in system, building from source')}}
bin/perl/host(std_box=bld/system/box,libgdbm_ver=boot,sdk_target=10.15)
{% elif native %}
bin/perl/host(std_box=bld/boot/box,libgdbm_ver=boot,sdk_target=10.15)
{% else %}
bin/perl(sdk_target=10.15)
{% endif %}
{% endblock %}
