{% block kernel_version %}
6.14.7
{% endblock %}

{% block kernel_sha %}
8112202bc26d086957a94d2109a6dcd4478c5ba18d0f0a5e1c5dfeea01f54972
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
