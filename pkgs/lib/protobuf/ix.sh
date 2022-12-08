{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v21.11.tar.gz
sha:b1d6dd2cbb5d87e17af41cadb720322ce7e13af826268707bd8db47e5654770b
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
{% endblock %}
