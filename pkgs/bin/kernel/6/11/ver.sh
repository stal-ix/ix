{% block kernel_version %}
6.11.11
{% endblock %}

{% block kernel_sha %}
62148e7e17f54c4a5ab5e75ad4882682c54bee818948be61a5963234fc0849fc
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
