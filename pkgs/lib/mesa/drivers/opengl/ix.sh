{% extends '//die/dl/fix.sh' %}

{% block export_prefix %}
o_
{% endblock %}

{% block export_symbols %}
{% endblock %}

{% block export_lib %}
{{driver}}_dri
{% endblock %}
