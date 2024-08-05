{% extends '//lib/linux/headers/t/ix.sh' %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.10.3.tar.xz
sha:fa5f22fd67dd05812d39dca579320c493048e26c4a556048a12385e7ae6fc698
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}
