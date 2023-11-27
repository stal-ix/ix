{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.61.tar.xz
sha:c21ba3530d530c736f9b3e6acc954d4404c1ce4abaf2a4694e46ecec17653fa0
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
