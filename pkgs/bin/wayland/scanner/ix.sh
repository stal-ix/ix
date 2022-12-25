{% extends 't/ix.sh' %}

{% block bld_libs %}
lib/c
lib/xml/2
lib/expat
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/wayland
{% endblock %}
