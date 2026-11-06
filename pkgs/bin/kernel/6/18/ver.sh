{% block kernel_version %}
6.18.62
{% endblock %}

{% block kernel_sha %}
490a7aedf1b355c565d3a6c05333ccccb5da82064eca46b590448a7099d7d651
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
