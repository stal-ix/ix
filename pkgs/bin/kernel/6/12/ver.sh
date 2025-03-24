{% block kernel_version %}
6.12.18
{% endblock %}

{% block kernel_sha %}
beb902a5f69d9e57710112203db38111dad6d30556ea8ce389284c8077fe944d
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
