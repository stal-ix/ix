{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v21.8.tar.gz
sha:032ef6fbb5b2ce2147e913b053003c7881fe53861571079b4351c006d6a822c1
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
{% endblock %}
