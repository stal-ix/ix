{% extends '//lib/linux/headers/t/ix.sh' %}

{% block pkg_name %}
linux-headers
{% endblock %}

{% block version %}
6.14.5
{% endblock %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.version().strip()}}.tar.xz
sha:28207ec52bbeaa3507010aeff944f442f7d9f22b286b79caf45ec6df1b24f409
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}
