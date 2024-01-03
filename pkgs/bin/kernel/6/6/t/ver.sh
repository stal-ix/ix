{% block kernel_version %}6-6-9{% endblock %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().replace('-', '.')}}.tar.xz
sha:8ebc65af0cfc891ba63dce0546583da728434db0f5f6a54d979f25ec47f548b3
{% endblock %}
