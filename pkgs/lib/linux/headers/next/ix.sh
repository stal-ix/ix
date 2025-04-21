{% extends '//lib/linux/headers/t/ix.sh' %}

{% block pkg_name %}
linux-headers
{% endblock %}

{% block version %}
6.14.3
{% endblock %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.version().strip()}}.tar.xz
sha:91c6c322c32568f09922a02ed35f46372ca8526714c6555b3115b9e9c156652a
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}
