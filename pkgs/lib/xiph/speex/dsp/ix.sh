{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://gitlab.xiph.org/xiph/speexdsp/-/archive/SpeexDSP-1.2.1/speexdsp-SpeexDSP-1.2.1.tar.bz2
sha:b36d4f16e42b7103b7fc3e4a8f98b6bf889dd1f70f65c2365af07be82844db29
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
