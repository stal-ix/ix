{% extends '//bin/kernel/t/2/ix.sh' %}

{% block kernel_version %}6-0-19{% endblock %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block kernel_headers %}
bin/kernel/6/0/headers
{% endblock %}
