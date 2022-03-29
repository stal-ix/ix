{% extends '//mix/dlstubs.sh' %}

{% block export_symbols %}
__driDriverExtensions
{% endblock %}

{% block export_lib %}
{{driver}}_dri
{% endblock %}
