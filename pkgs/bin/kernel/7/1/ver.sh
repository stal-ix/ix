{% block kernel_version %}
7.1.13
{% endblock %}

{% block kernel_sha %}
614d95fafdcb5cce2b6620e7edc6afbb606bffd4655405586815d84687841ad7
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
