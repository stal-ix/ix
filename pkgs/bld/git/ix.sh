{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_git) and ix_boot_tool('git') %}
bld/system/shim(tool_name={{ix_boot_tool('git')}})
{% elif all_system or system_git %}
{{ix.warn('git not found in system, building from source')}}
bin/git/unwrap(libcurl_ver=http1)
{% else %}
bin/git/unwrap(libcurl_ver=http1)
{% endif %}
{% endblock %}
