{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v21.7.tar.gz
sha:75be42bd736f4df6d702a0e4e4d30de9ee40eac024c4b845d17ae4cc831fe4ae
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
{% endblock %}
