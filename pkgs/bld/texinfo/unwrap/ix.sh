{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/fake/er(tool_name=texinfo)
bld/fake/er(tool_name=makeinfo)
{% endblock %}
