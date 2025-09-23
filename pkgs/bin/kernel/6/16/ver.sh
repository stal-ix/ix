{% block kernel_version %}
6.16.7
{% endblock %}

{% block kernel_sha %}
5be3daa1f9427b1bdb34c4894d9c1adfac38cff674376fe0611a3065729a1a81
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
