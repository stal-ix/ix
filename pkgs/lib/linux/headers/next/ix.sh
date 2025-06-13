{% extends '//lib/linux/headers/t/ix.sh' %}

{% block pkg_name %}
linux-headers
{% endblock %}

{% block version %}
6.15.1
{% endblock %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.version().strip() | strip_suffix('.0')}}.tar.xz
44f1bb84fe512e7bafe0e6dc85d38ec1c6c8fcbe97ccb51d8c19930b799f0d64
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}
