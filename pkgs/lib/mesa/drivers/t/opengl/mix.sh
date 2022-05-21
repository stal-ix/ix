{% extends '//die/dl/fix.sh' %}

{% block export_symbols %}
__driDriverGetExtensions_{{driver}}
{% endblock %}

{% block export_lib %}
{{driver}}_dri
{% endblock %}
