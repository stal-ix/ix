{% extends '//bin/kernel/t/1/mix.sh' %}

{% block kernel_name %}
5.15.23
{% endblock %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block host_libs %}
{{super()}}
bin/kernel/15/headers
{% endblock %}

{% block kconfig_flags %}
{% include 'cfg' %}
{{super()}}
{% endblock %}
