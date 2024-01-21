{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/dbry/WavPack/releases/download/5.6.0/wavpack-5.6.0.tar.xz
sha:af8035f457509c3d338b895875228a9b81de276c88c79bb2d3e31d9b605da9a9
#https://github.com/dbry/WavPack/archive/refs/tags/5.6.0.tar.gz
#sha:44043e8ffe415548d5723e9f4fc6bda5e1f429189491c5fb3df08b8dcf28df72
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
