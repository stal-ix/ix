{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.66.tar.xz
sha:7a78b757080ed6518c1c4fa26ad6a7a3d6e4e385386a20b6fb52379e7d1ffa36
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
