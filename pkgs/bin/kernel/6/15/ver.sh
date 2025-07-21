{% block kernel_version %}
6.15.7
{% endblock %}

{% block kernel_sha %}
3507dd105b0a0e1101bd43d294472fccf853429a259a5fa7c67467bba318f8e9
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
