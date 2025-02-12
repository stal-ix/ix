{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.72.tar.xz
sha:38ff0ab04cf6d42cd1f9be49a1475c5aa5c71a0e0300bcc8a83956f6153a466d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
