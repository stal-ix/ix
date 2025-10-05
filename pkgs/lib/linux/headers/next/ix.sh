{% extends '//lib/linux/headers/t/ix.sh' %}

{% include '//bin/kernel/6/17/ver.sh' %}

{% block pkg_name %}
linux-headers
{% endblock %}

{% block version %}
{{self.kernel_version().strip()}}
{% endblock %}

{% block fetch %}
{{self.kernel_url().strip()}}
{{self.kernel_sha().strip()}}
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}
