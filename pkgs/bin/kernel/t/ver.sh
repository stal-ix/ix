{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}

{% block fetch %}
{{self.kernel_url().strip()}}
{{self.kernel_sha().strip()}}
{% endblock %}
