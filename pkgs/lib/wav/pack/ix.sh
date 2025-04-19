{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
WavPack
{% endblock %}

{% block version %}
5.8.1
{% endblock %}

{% block fetch %}
https://github.com/dbry/WavPack/releases/download/{{self.version().strip()}}/wavpack-{{self.version().strip()}}.tar.xz
sha:7322775498602c8850afcfc1ae38f99df4cbcd51386e873d6b0f8047e55c0c26
#https://github.com/dbry/WavPack/archive/refs/tags/5.8.1.tar.gz
#sha:44043e8ffe415548d5723e9f4fc6bda5e1f429189491c5fb3df08b8dcf28df72
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
