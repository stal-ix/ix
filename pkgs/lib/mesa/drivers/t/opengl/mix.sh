{% extends '//mix/dlstubs.sh' %}

{% block export_symbols %}
__driDriverGetExtensions_{{driver}}
{% endblock %}

{% block export_lib %}
{{driver}}_dri
{% endblock %}
