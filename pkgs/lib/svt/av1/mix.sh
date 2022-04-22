{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v1.0.0/SVT-AV1-v1.0.0.tar.bz2
sha:0a7893b041735e603d7fc4979d46088327e2716946b70764d3408193a1f1b55e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/nasm
{% endblock %}
