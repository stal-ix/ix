{% extends '//lib/ffi/t/ix.sh' %}

{% block bld_tool %}
bld/auto/python
bld/fake(tool_name=makeinfo)
{{super()}}
{% endblock %}
