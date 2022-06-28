{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v21.2.tar.gz
sha:ca983c9d2c8f8c935513642bcc4b2cbc64e4046e0bb16bf2ff893128577ece8c
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
{% endblock %}
