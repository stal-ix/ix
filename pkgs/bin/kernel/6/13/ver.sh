{% block kernel_version %}
6.13.8
{% endblock %}

{% block kernel_sha %}
259afa59d73d676bec2ae89beacd949e08d54d3f70a7f8b0a742315095751abb
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
