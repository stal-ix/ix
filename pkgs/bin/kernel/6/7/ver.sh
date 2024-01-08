{% block kernel_version %}6-7{% endblock %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().replace('-', '.')}}.tar.xz
sha:
{% endblock %}
