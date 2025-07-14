{% block kernel_version %}
6.15.6
{% endblock %}

{% block kernel_sha %}
2bb586c954277d070c8fdf6d7275faa93b4807d9bf3353b491d8149cca02b4fc
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
