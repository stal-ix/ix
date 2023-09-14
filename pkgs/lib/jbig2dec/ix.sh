{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/ArtifexSoftware/jbig2dec/archive/refs/tags/0.20.tar.gz
sha:a9705369a6633aba532693450ec802c562397e1b824662de809ede92f67aff21
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
