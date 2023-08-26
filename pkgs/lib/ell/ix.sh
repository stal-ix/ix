{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.58.tar.xz
sha:531a980589c8954ff12a3110b4d958fa75a74c88ddcc3e2ace4317e76a7c1e9b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
