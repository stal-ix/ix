{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/ArtifexSoftware/jbig2dec/archive/refs/tags/0.19.tar.gz
sha:e81b787ad0b147a437a52d9ce7de1a8f429655e8aa030383b6b2dd8919373717
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
