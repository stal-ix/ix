{% extends '//lib/qt/6/declarative/t/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/qt/6/tools/qml
{% endblock %}

{% block postinstall %}
:
{% endblock %}
