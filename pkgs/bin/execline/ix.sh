{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/skarnet/execline/archive/refs/tags/v2.9.5.1.tar.gz
sha:75e5b680504b321d78ccf53cbf3f679d26a784dcc5a08fb3cf44c9e127353577
{% endblock %}

{% block lib_deps %}
lib/c
lib/skalibs
{% endblock %}

{% block configure_flags %}
--enable-multicall
{% endblock %}
