{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.70.tar.xz
sha:1bb7f5d73df34b46c4dd340fec98442d7dac2a7b4ce0ee3fc779ca2fbe6fe591
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
