{% extends '//lib/linux/headers/t/ix.sh' %}

{% block pkg_name %}
linux-headers
{% endblock %}

{% block version %}
6.14.6
{% endblock %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.version().strip()}}.tar.xz
sha:21817f1998e2230f81f7e4f605fa6fdcb040e14fa27d99c27ddb16ce749797a9
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}
