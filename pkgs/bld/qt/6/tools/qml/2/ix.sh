{% extends '//bld/qt/6/tools/qml/1/ix.sh' %}

{% block bld_tool %}
bld/qt/6/tools/qml/1
{{super()}}
{% endblock %}

{% block ninja_build_targets %}
bin/qmlcachegen
{{super()}}
{% endblock %}

{% block ninja_install_targets %}
src/qmlcachegen/install
{{super()}}
{% endblock %}
