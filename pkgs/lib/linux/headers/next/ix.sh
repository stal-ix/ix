{% extends '//lib/linux/headers/t/ix.sh' %}

{% block pkg_name %}
linux-headers
{% endblock %}

{% block version %}
6.14.7
{% endblock %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.version().strip()}}.tar.xz
sha:8112202bc26d086957a94d2109a6dcd4478c5ba18d0f0a5e1c5dfeea01f54972
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}
