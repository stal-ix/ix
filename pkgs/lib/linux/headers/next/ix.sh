{% extends '//lib/linux/headers/t/ix.sh' %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.14.tar.xz
sha:a294b683e7b161bb0517bb32ec7ed1d2ea7603dfbabad135170ed12d00c47670
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}
