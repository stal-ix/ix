{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.67.tar.xz
sha:97942e8cefb130b632496e5485242f3f374f3b8846800fb74fffd76dc2a0c726
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
