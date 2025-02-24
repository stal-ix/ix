{% extends '//die/dl/fix.sh' %}

{% block export_symbols %}
gbmint_get_backend
{% endblock %}

{% block export_lib %}
dri_gbm
{% endblock %}
