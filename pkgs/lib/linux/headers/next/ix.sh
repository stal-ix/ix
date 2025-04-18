{% extends '//lib/linux/headers/t/ix.sh' %}

{% block pkg_name %}
linux-headers
{% endblock %}

{% block version %}
6.14.2
{% endblock %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.version().strip()}}.tar.xz
sha:c5c682a354ea3190139357a57d34a79e5c37221ace823a938e10116b577a2e1b
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}
