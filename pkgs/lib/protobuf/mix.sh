{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v3.20.0.tar.gz
sha:b07772d38ab07e55eca4d50f4b53da2d998bb221575c60a4f81100242d4b4889
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
{% endblock %}
