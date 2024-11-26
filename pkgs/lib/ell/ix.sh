{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.71.tar.xz
sha:850f79cc993791f00232fd31cbaf3e8212edcef25ca0515f98c6d48dfb5952d7
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
