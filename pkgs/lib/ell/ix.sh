{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.56.tar.xz
sha:58eb8b2b64087f7479d5db6a830a0656c536d93e5f11d4c9a4443ce8760a1b63
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
