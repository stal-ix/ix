{% extends '//bin/kernel/t/1/ix.sh' %}

{% block kernel_name %}
5-18-6-slot{{self.slot()}}
{% endblock %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block host_libs %}
{{super()}}
bin/kernel/18/headers
{% endblock %}
