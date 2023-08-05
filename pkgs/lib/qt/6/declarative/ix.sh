{% extends 't/ix.sh' %}

{% block task_pool %}full{% endblock %}

{% block bld_tool %}
{{super()}}
bld/qt/6/tools/qml
{% endblock %}

{% block cpp_defines %}
{{super()}}
QT_STATICPLUGIN=1
{% endblock %}
