{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.76.tar.xz
sha:a0bf2b5a78450c0c167e3f65c18452ffe4c0f179d48c2a3661e6afaca8017ef9
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
