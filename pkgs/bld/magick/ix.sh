{# magick as a build tool: the system one under all_system, as every other
   bld/ tool, else a lean build from source #}

{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_magick) and ix_boot_tool('magick') %}
bld/system/shim(tool_name={{ix_boot_tool('magick')}})
{% elif all_system or system_magick %}
{{ix.warn('magick not found in system, building from source')}}
bin/convert/lite
{% else %}
bin/convert/lite
{% endif %}
{% endblock %}
