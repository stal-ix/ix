{% extends 't/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/qt/6/wayland
{% endblock %}

{% block patch %}
>src/compositor/global/qwaylandquickextension.cpp
{% endblock %}
