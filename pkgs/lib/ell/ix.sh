{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ell
{% endblock %}

{% block version %}
0.82
{% endblock %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-{{self.version().strip()}}.tar.xz
133a9273151090b4cc37676063cc00ff350a093032ba20a2aaf8b3c5fd6f8b6d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
