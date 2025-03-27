{% extends '//die/dl/fix.sh' %}

{% block export_symbols %}
DxcCreateInstance
DxcCreateInstance2
{% endblock %}

{% block export_lib %}
dxcompiler
{% endblock %}

{% block env %}
export PLUGIN=${out}/lib/reg.o
{% endblock %}
