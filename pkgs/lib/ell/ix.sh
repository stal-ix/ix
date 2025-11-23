{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ell
{% endblock %}

{% block version %}
0.81
{% endblock %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-{{self.version().strip()}}.tar.xz
672ca1e44dc0ddce1665941754b4e2b3b9203481d7d7a60e0b5f39829d73fa14
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
