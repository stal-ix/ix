{% extends '//bin/kernel/t/mix.sh' %}

{% block kernel_name %}
5.15.16
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
{% endblock %}
