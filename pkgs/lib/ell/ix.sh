{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.75.tar.xz
sha:10cee84ee075d9e0fc1c65fa1acdf7f6ffc2b3ed7e09622be9fc8f8979b02bd5
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
