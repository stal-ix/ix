{% block kernel_version %}
6.17.1
{% endblock %}

{% block kernel_sha %}
a53dbe3f41491922a61f17c5cc551e88f544d5411aeb1c8c65c402795c4f4da0
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
