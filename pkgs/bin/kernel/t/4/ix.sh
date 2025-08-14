{% extends '//bin/kernel/t/3/ix.sh' %}

{% block pkg_name %}
linux-kernel
{% endblock %}

{% block version %}
{{self.kernel_version().strip()}}
{% endblock %}

{% block fetch %}
{{self.kernel_url().strip()}}
{{self.kernel_sha().strip()}}
{% endblock %}
