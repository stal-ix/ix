{% extends '//die/dl/fix.sh' %}

{% block export_symbols %}
DxcCreateInstance
DxcCreateInstance2
{% endblock %}

{% block export_lib %}
dxcompiler
{% endblock %}
