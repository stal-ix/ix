{% extends '//lib/linux/headers/t/ix.sh' %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.18.14.tar.xz
sha:e17d46451133d3a3099b09e200839e875100b48403171923ab71b6a9b39856af
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}
