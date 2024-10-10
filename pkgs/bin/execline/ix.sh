{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/skarnet/execline/archive/refs/tags/v2.9.6.1.tar.gz
sha:e718d73a0fa667f270763776a58213a027cb85dd5db9ad8331fa62b123911b29
{% endblock %}

{% block lib_deps %}
lib/c
lib/skalibs
{% endblock %}

{% block configure_flags %}
--enable-multicall
{% endblock %}
