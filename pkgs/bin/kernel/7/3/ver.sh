{% block kernel_version %}
7.3.1
{% endblock %}

{% block kernel_sha %}
fa595aad93734f829c963c2a90ef7c3673224fd7fdae7b49406e397cde2de231
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
