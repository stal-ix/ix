{% block kernel_version %}
6.14.5
{% endblock %}

{% block kernel_sha %}
28207ec52bbeaa3507010aeff944f442f7d9f22b286b79caf45ec6df1b24f409
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
