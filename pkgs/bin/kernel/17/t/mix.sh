{% extends '//bin/kernel/t/1/mix.sh' %}

{% block kernel_name %}
5.17-rc8-slot{% block slot %}{% endblock %}
{% endblock %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block host_libs %}
{{super()}}
bin/kernel/17/headers
{% endblock %}
