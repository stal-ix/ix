{% block kernel_version %}
7.2.7
{% endblock %}

{% block kernel_sha %}
4ac34c47db2540ffb2713943f8d891ff1702e0ba6934525a493b7d1cad43145a
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
