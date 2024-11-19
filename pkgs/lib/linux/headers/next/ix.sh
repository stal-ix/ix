{% extends '//lib/linux/headers/t/ix.sh' %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.12.tar.xz
sha:b1a2562be56e42afb3f8489d4c2a7ac472ac23098f1ef1c1e40da601f54625eb
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}
