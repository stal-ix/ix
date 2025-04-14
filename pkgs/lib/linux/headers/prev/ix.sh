{% extends '//lib/linux/headers/t/ix.sh' %}

{% block pkg_name %}
linux-headers
{% endblock %}

{% block version %}
5.18.14
{% endblock %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-{{self.version().strip()}}.tar.xz
sha:e17d46451133d3a3099b09e200839e875100b48403171923ab71b6a9b39856af
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}
