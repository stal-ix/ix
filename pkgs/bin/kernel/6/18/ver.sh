{% block kernel_version %}
6.18.63
{% endblock %}

{% block kernel_sha %}
81764a545072d160748beff4d9de2e7d95aa9f16e8261110288f067a2cc61d71
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
