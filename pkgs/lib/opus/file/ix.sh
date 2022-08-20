{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://downloads.xiph.org/releases/opus/opusfile-0.12.tar.gz
sha:118d8601c12dd6a44f52423e68ca9083cc9f2bfe72da7a8c1acb22a80ae3550b
{% endblock %}

{% block lib_deps %}
lib/c
lib/opus
lib/openssl
lib/xiph/ogg
{% endblock %}
