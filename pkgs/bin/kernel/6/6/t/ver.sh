{% block kernel_version %}6-6-7{% endblock %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().replace('-', '.')}}.tar.xz
sha:0ce68ec6019019140043263520955ecd04839e55a1baab2fa9155b42bb6fd841
{% endblock %}
