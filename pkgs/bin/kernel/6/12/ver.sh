{% block kernel_version %}
6.12-rc5
{% endblock %}

{% block kernel_sha %}
02f4d008929d8d62af2a1cd585b4dc58c0c7a427855515b7832ecb34f6f385b1
{% endblock %}

{% block kernel_url %}
https://git.kernel.org/torvalds/t/linux-{{self.kernel_version().strip()}}.tar.gz
{% endblock %}

{% block fetch %}
{{self.kernel_url().strip()}}
{{self.kernel_sha().strip()}}
{% endblock %}
