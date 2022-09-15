{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v21.6.tar.gz
sha:dbb16fdbca8f277c9a194d9a837395cde408ca136738d94743130dd0de015efd
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
{% endblock %}
