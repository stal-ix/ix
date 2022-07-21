{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/knik0/faac/archive/refs/tags/1_30.tar.gz
sha:adc387ce588cca16d98c03b6ec1e58f0ffd9fc6eadb00e254157d6b16203b2d2
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
