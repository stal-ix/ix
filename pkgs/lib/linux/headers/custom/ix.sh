{% extends '//lib/linux/headers/t/ix.sh' %}

{% block fetch %}
{{kernel_url}}
{{kernel_sha}}
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}
