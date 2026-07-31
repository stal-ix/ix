{% block kernel_version %}
7.1.3
{% endblock %}

{% block kernel_sha %}
be41c068e88f5242a19bccdbffbe077b18c47b45f627e2325504b4fab79dd1dc
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
