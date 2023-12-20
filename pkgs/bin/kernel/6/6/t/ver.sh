{% block kernel_version %}6-6-8{% endblock %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().replace('-', '.')}}.tar.xz
sha:5036c434e11e4b36d8da3f489851f7f829cf785fa7f7887468537a9ea4572416
{% endblock %}
