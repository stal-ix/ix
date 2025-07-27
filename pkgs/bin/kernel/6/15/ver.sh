{% block kernel_version %}
6.15.8
{% endblock %}

{% block kernel_sha %}
d37e92bc16b962a3025df156647bdad90b2db4ff36c7a6137817fe81ef3f28a6
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
