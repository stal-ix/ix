{% block kernel_version %}
6.14.4
{% endblock %}

{% block kernel_sha %}
9452f28d7a0051fba4886712395b484c4c7fcf9f85944a62fd3d97dc923f5339
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
