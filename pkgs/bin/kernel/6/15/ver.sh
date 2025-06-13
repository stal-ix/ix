{% block kernel_version %}
6.15.2
{% endblock %}

{% block kernel_sha %}
3458cd6a6c508e161dbc5406e72b99d5dbdf929faf704a67db9ba46d07514858
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
