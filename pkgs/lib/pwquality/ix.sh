{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libpwquality
{% endblock %}

{% block version %}
1.4.5
{% endblock %}

{% block fetch %}
https://github.com/libpwquality/libpwquality/releases/download/libpwquality-{{self.version().strip()}}/libpwquality-{{self.version().strip()}}.tar.bz2
6fcf18b75d305d99d04d2e42982ed5b787a081af2842220ed63287a2d6a10988
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-cracklib-check
--disable-nls
--disable-pam
--disable-python-bindings
{% endblock %}
