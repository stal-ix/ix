{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.68.tar.xz
sha:ddcbf381d758f61a02954bf5d2907c8900462abb7b2dcf45589874978bc10125
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
