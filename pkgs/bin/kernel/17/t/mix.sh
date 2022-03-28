{% extends '//bin/kernel/t/1/mix.sh' %}

{% block kernel_name %}
5-17-1-slot{{self.slot()}}
{% endblock %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block host_libs %}
{{super()}}
bin/kernel/17/headers
{% endblock %}
