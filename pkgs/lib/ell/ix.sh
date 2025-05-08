{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ell
{% endblock %}

{% block version %}
0.77
{% endblock %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-{{self.version().strip()}}.tar.xz
sha:85884a8da59de4e88db065da41b21ebee7074754a52ef69bad53fe2acb64d5d3
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
