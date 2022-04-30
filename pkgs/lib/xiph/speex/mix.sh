{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://downloads.xiph.org/releases/speex/speex-1.2.0.tar.gz
sha:eaae8af0ac742dc7d542c9439ac72f1f385ce838392dc849cae4536af9210094
{% endblock %}

{% block lib_deps %}
lib/c
lib/xiph/ogg
{% endblock %}
