{% block kernel_version %}
6.18.64
{% endblock %}

{% block kernel_sha %}
020d45510c539972e6f14c5c71566878d3b7ef56fb082b3e09134f2ebaade562
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
