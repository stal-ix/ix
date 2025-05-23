{% extends '//lib/linux/headers/t/ix.sh' %}

{% block pkg_name %}
linux-headers
{% endblock %}

{% block version %}
6.14.8
{% endblock %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.version().strip()}}.tar.xz
sha:62b12ecd3075a357eb320935657de84e01552803717dad383fa7cc3aa4aa2905
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}
