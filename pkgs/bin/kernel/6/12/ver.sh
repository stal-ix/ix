{% block kernel_version %}
6.12-rc3
{% endblock %}

{% block kernel_sha %}
c9b271cc559588796a80f06f4198a4de2823bc28cb5cd2632f3b80401035b91d
{% endblock %}

{% block kernel_url %}
https://git.kernel.org/torvalds/t/linux-6.12-rc3.tar.gz
{% endblock %}

{% block fetch %}
{{self.kernel_url().strip()}}
{{self.kernel_sha().strip()}}
{% endblock %}
