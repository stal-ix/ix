{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/skarnet/execline/archive/refs/tags/v2.9.5.0.tar.gz
sha:e5d6238f295acb65b1e327af62e0cac381c8c10e3fd3d49e9fd1fb83155cf92e
{% endblock %}

{% block lib_deps %}
lib/c
lib/skalibs
{% endblock %}

{% block configure_flags %}
--enable-multicall
{% endblock %}
