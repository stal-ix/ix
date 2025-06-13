{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
WavPack
{% endblock %}

{% block version %}
5.8.1
{% endblock %}

{% block fetch %}
https://github.com/dbry/WavPack/releases/download/{{self.version().strip()}}/wavpack-{{self.version().strip()}}.tar.xz
7322775498602c8850afcfc1ae38f99df4cbcd51386e873d6b0f8047e55c0c26
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
