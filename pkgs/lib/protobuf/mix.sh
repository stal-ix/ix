{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v3.19.1.tar.gz
e5cb6707320a077f0618b669d1856bc4
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
{% endblock %}

{% block autoreconf %}
sh autogen.sh
{% endblock %}
