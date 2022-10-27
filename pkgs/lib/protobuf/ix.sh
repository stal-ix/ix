{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v21.9.tar.gz
sha:0aa7df8289c957a4c54cbe694fbabe99b180e64ca0f8fdb5e2f76dcf56ff2422
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
{% endblock %}
