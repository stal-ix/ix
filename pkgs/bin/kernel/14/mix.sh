{% extends '//bin/kernel/t/1/mix.sh' %}

{% block kernel_name %}
5.14.21
{% endblock %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block host_libs %}
{{super()}}
bin/kernel/14/headers
{% endblock %}

{% block kconfig_flags %}
{% include 'cfg' %}
{{super()}}
{% endblock %}
