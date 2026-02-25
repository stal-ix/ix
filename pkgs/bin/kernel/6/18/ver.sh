{% block kernel_version %}
6.18.13
{% endblock %}

{% block kernel_sha %}
ed2c3c55fd38e6836c094fce356f2567f9516130b73354a29857960368c5687f
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
