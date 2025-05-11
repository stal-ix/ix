{% block kernel_version %}
6.14.6
{% endblock %}

{% block kernel_sha %}
21817f1998e2230f81f7e4f605fa6fdcb040e14fa27d99c27ddb16ce749797a9
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
