{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.60.tar.xz
sha:61cec2df694b548e51afa3e7ffd1e1ad31a9fea7bedb93a3a3cc60894390c70f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
