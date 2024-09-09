{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.69.tar.xz
sha:6cfc0888edc94de9f0623798609587b2cc11b92b892945f317e8d199afe7b12e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
