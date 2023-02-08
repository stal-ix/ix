{% extends '//bin/transmission/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/qt/6/base
lib/qt/6/deps
{% endblock %}

{% block cmake_flags %}
{{super()}}
ENABLE_QT=ON
USE_QT_VERSION=6
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/qt/6
bld/qt/6/tools
{% endblock %}
