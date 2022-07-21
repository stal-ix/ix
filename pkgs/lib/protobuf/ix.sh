{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v21.3.tar.gz
sha:1e958b62debbb46ebefa16d848741d17c88dc018dd57b729c0cd58965380f3f8
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
{% endblock %}
