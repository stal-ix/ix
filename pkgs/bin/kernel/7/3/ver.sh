{% block kernel_version %}
7.3.4
{% endblock %}

{% block kernel_sha %}
b11b6df8295e8e991ff040b71aaa4994a8b55caa23b6b092907f195b5840fd1f
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
