{% block kernel_version %}
6.12-rc4
{% endblock %}

{% block kernel_sha %}
41356c3cac4b55170506629cab54f3a0ab5a57c0fd1f0e976dbbe66a0a74cc87
{% endblock %}

{% block kernel_url %}
https://git.kernel.org/torvalds/t/linux-{{self.kernel_version().strip()}}.tar.gz
{% endblock %}

{% block fetch %}
{{self.kernel_url().strip()}}
{{self.kernel_sha().strip()}}
{% endblock %}
