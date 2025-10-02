{% block kernel_version %}
6.17
{% endblock %}

{% block kernel_sha %}
9b607166a1c999d8326098121222feb080a20a3253975fcdfa2de96ba7f757a7
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
