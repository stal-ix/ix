{% block kernel_version %}
6.15.3
{% endblock %}

{% block kernel_sha %}
12b50c89925438d9cd7385a0cafc9c433e6562ac5df00a21889fce9f548d65b0
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
