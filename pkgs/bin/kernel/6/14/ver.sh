{% block kernel_version %}
6.14.2
{% endblock %}

{% block kernel_sha %}
c5c682a354ea3190139357a57d34a79e5c37221ace823a938e10116b577a2e1b
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
