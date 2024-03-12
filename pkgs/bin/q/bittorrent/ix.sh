{% extends 't/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/qt/6/deps
lib/qt/6/base
{% endblock %}
