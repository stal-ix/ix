{% extends '//bin/kernel/18/t/ix.sh' %}

{% block kernel_version %}5-19-5{% endblock %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block kernel_headers %}
lib/linux/19
{% endblock %}

{% block bld_tool %}
bld/bash
{{super()}}
{% endblock %}
