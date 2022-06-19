{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://gitlab.xiph.org/xiph/speex/-/archive/Speex-1.2.1/speex-Speex-1.2.1.tar.bz2
sha:cc55cce69d8753940d56936f7a1fe6db4b302df144aec93a92de1c65b1a87681
{% endblock %}

{% block lib_deps %}
lib/c
lib/xiph/ogg
{% endblock %}
