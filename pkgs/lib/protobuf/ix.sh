{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v21.1.tar.gz
sha:f1a83673cbcaff6346a8fba87a9c02c0f943a4a696b6c7d1b71586d97609db12
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
{% endblock %}
