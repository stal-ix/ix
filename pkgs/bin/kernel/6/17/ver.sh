{% block kernel_version %}
6.17.13
{% endblock %}

{% block kernel_sha %}
116802dc3ad1646163cc6ffe9bddba24a8069b569135ec0523cd799064f2edb9
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
