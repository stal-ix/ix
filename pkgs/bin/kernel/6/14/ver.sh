{% block kernel_version %}
6.14
{% endblock %}

{% block kernel_sha %}
a294b683e7b161bb0517bb32ec7ed1d2ea7603dfbabad135170ed12d00c47670
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
