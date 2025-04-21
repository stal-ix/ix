{% block kernel_version %}
6.14.3
{% endblock %}

{% block kernel_sha %}
91c6c322c32568f09922a02ed35f46372ca8526714c6555b3115b9e9c156652a
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
