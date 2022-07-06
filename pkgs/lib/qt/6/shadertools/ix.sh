{% extends 't/ix.sh' %}

{% block bld_tool %}
bld/qt/6/tools/shader
{{super()}}
{% endblock %}
