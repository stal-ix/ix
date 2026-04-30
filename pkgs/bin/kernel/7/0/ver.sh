{% block kernel_version %}
7.0.3
{% endblock %}

{% block kernel_sha %}
0bedadbf5788693ddebbcc913c893f1a97349af79ddde7144c2a80b401959f1c
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
