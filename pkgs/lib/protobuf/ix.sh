{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v21.10.tar.gz
sha:f3f9ce6dc288f2f939bdc9d277ebdfbc8dbcd51741071f93da70e0e62919f57f
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
{% endblock %}
