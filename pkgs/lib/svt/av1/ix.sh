{% extends '//die/cmake.sh' %}

{% block fetch %}
https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v1.1.0/SVT-AV1-v1.1.0.tar.bz2
sha:120dc98d5ccbb4ed326879c6dd4791fa579cdde3dbebf2fad4dd751d8fa7f762
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/nasm
{% endblock %}
