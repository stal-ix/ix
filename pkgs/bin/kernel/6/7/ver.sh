{% block kernel_version %}
6.7.2
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.7.2.tar.xz
{% endblock %}

{% block kernel_sha %}
c34de41baa29c475c0834e88a3171e255ff86cd32d83c6bffc2b797e60bfa671
{% endblock %}

{% include '//bin/kernel/t/ver.sh' %}
