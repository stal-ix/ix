{% block kernel_version %}
6.12.32
{% endblock %}

{% block kernel_sha %}
a9b020721778384507010177d3929e7d4058f7f6120f05a99d56b5c5c0346a70
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
