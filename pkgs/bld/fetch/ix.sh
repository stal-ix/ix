{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if not isfile('/bin/fetcher') %}
{% if (all_system or system_curl) and ix_boot_tool('curl') %}
bld/system/shim(tool_name={{ix_boot_tool('curl')}})
{% else %}
bin/curl
{% endif %}
bld/python
bld/fetch/bootstrap
{% endif %}
bld/fetch/scripts
{% endblock %}
