{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/hpjansson/chafa/archive/refs/tags/1.12.4.tar.gz
sha:6a76719a1d67b772dcf81cd6959cfebae74ea1c92a09759e11b52f30b9345d40
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/ns/gif
{% endblock %}
