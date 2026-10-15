{% block kernel_version %}
6.16.12
{% endblock %}

{% block kernel_sha %}
7ca4debc5ca912ebb8a76944a5c118afd5d09e31ef43c494adb14273da29a26e
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
