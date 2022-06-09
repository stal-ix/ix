{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://gitlab.xiph.org/xiph/speexdsp/-/archive/SpeexDSP-1.2.0/speexdsp-SpeexDSP-1.2.0.tar.bz2
sha:0fe0e31be215f820bed0f9c913c673997773fce3a03a4555658e7b73a54eed7b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
