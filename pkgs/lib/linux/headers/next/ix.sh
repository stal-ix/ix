{% extends '//lib/linux/headers/t/ix.sh' %}

{% block pkg_name %}
linux-headers
{% endblock %}

{% block version %}
6.15.0
{% endblock %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.version().strip() | strip_suffix('.0')}}.tar.xz
sha:7586962547803be7ecc4056efc927fb25214548722bd28171172f3599abb9764
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}
