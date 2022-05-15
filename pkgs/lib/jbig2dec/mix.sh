{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/ArtifexSoftware/jbig2dec/archive/refs/tags/0.19.zip
sha:839533cbc0990e7f54813a6d036de3b4ed301375c29d06b212346f9f423ed7c3
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
