{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v3.20.1.tar.gz
sha:8b28fdd45bab62d15db232ec404248901842e5340299a57765e48abe8a80d930
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
{% endblock %}
