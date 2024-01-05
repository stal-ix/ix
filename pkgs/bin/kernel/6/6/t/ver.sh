{% block kernel_version %}6-6-10{% endblock %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().replace('-', '.')}}.tar.xz
sha:9ee627e4c109aec7fca3eda5898e81d201af2c7eb2f7d9d7d94c1f0e1205546c
{% endblock %}
