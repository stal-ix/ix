{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
speex
{% endblock %}

{% block version %}
1.2.1
{% endblock %}

{% block fetch %}
https://gitlab.xiph.org/xiph/speex/-/archive/Speex-{{self.version().strip()}}/speex-Speex-{{self.version().strip()}}.tar.bz2
cc55cce69d8753940d56936f7a1fe6db4b302df144aec93a92de1c65b1a87681
{% endblock %}

{% block lib_deps %}
lib/c
lib/xiph/ogg
{% endblock %}
