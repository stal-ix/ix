{% extends '//lib/linux/headers/t/ix.sh' %}

{% block pkg_name %}
linux-headers
{% endblock %}

{% block version %}
6.14.4
{% endblock %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.version().strip()}}.tar.xz
sha:9452f28d7a0051fba4886712395b484c4c7fcf9f85944a62fd3d97dc923f5339
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}
