{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libffi
{% endblock %}

{% block version %}
3.5.1
{% endblock %}

{% block fetch %}
https://github.com/libffi/libffi/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:ca180dccd8e26900a169efd6e09207eaa0a9be268010b8faec10476c9c4951d9
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}
