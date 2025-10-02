{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ell
{% endblock %}

{% block version %}
0.80
{% endblock %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-{{self.version().strip()}}.tar.xz
6efc70ae6d3e2ca1ec255ecd855a3d5fadefe59897f4307816e3ba7a771f3d00
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
