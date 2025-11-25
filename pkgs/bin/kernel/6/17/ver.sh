{% block kernel_version %}
6.17.8
{% endblock %}

{% block kernel_sha %}
5a8de64a75fca706c01c6c0a77cf75a74618439db195e25f1f0268af6b2fb1da
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
