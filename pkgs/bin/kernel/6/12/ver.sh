{% block kernel_version %}
6.12.28
{% endblock %}

{% block kernel_sha %}
e8a099182562aecff781de72ce769461e706d97af42d740dff20eb450dd5771e
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
