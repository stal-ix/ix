{% block kernel_version %}
7.2.15
{% endblock %}

{% block kernel_sha %}
d0f6b1d7324c937ccaeb5c4ca7084bfcf71db2edb3e2d3a31f0ad83a681809ab
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
