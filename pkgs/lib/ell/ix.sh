{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ell
{% endblock %}

{% block version %}
0.83
{% endblock %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-{{self.version().strip()}}.tar.xz
39a562f5ab2768e69da1ffbb1f98a8eb3483baffc7d2ef6adc3705e4fd4e53fb
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
