{% extends '//bin/kernel/18/t/ix.sh' %}

{% block kernel_version %}5-19-10{% endblock %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block kernel_headers %}
bin/kernel/19/headers
{% endblock %}

{% block bld_tool %}
bld/bash
{{super()}}
{% endblock %}
