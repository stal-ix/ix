{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_re2c) and ix_boot_tool('re2c') %}
bld/system/shim(tool_name={{ix_boot_tool('re2c')}})
{% elif all_system or system_re2c %}
{{ix.warn('re2c not found in system, building from source')}}
bin/re2c(std_box=bld/system/box)
{% elif native %}
bin/re2c(std_box=bld/boot/box)
{% else %}
bin/re2c
{% endif %}
{% endblock %}
