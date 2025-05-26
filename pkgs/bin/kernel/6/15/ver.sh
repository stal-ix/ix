{% block kernel_version %}
6.15
{% endblock %}

{% block kernel_sha %}
7586962547803be7ecc4056efc927fb25214548722bd28171172f3599abb9764
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
