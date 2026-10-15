{# wasm-opt from binaryen as a build tool: the system one under all_system,
   as the other bld/ tools, else built from source #}

{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_binaryen) and ix_boot_tool('wasm-opt') %}
bld/system/shim(tool_name={{ix_boot_tool('wasm-opt')}})
{% elif all_system or system_binaryen %}
{{ix.warn('wasm-opt not found in system, building from source')}}
bin/binaryen
{% else %}
bin/binaryen
{% endif %}
{% endblock %}
