{% extends '//die/dl/fix.sh' %}

{% block export_symbols %}
meta_plugin_register_type
{% endblock %}

{% block export_lib %}
default
{% endblock %}

{% block env %}
export PLUGIN=${out}/lib/reg.o
{% endblock %}
