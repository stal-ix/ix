{% block kernel_version %}
6.16.10
{% endblock %}

{% block kernel_sha %}
ab06bba8851e4b682e8834f6f90e56d32dcf98d8c62cd537676104cfd757a8f2
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
