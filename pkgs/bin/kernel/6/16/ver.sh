{% block kernel_version %}
6.16.11
{% endblock %}

{% block kernel_sha %}
5f304f0c453d87ac765207359da4f5a733939d1595ef258f1809194fa18dba7b
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
