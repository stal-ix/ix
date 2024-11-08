{% block kernel_version %}
6.12-rc6
{% endblock %}

{% block kernel_sha %}
7932703bbf3859932f615c21de4c5ae56d99dc85525bc2361d543216cff7e4ca
{% endblock %}

{% block kernel_url %}
https://git.kernel.org/torvalds/t/linux-{{self.kernel_version().strip()}}.tar.gz
{% endblock %}

{% block fetch %}
{{self.kernel_url().strip()}}
{{self.kernel_sha().strip()}}
{% endblock %}
