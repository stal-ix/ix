{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/skarnet/execline/archive/refs/tags/v2.9.4.0.tar.gz
sha:70798b7b5595743a6512fb2157234f7ef2399a0d81099774aecb61017f451b2d
{% endblock %}

{% block lib_deps %}
lib/c
lib/skalibs
{% endblock %}

{% block configure_flags %}
--enable-multicall
{% endblock %}
