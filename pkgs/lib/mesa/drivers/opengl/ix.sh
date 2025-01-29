{% extends '//die/dl/fix.sh' %}

{% block export_symbols %}
driver_descriptor={{driver}}_driver_descriptor
{% endblock %}

{% block export_lib %}
pipe_{{driver}}
{% endblock %}
