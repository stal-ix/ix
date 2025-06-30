{% block kernel_version %}
6.15.4
{% endblock %}

{% block kernel_sha %}
0eafd627b602f58d73917d00e4fc3196ba18cba67df6995a42aa74744d8efa16
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
