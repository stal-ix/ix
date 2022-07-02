{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://kernel.googlesource.com/pub/scm/bluetooth/sbc/+archive/8dc5d5ba381512ad5b1afa45c63ec6b0a3833244.tar.gz
sem:b873a9da3d89a35363745df3b856641059043d877151c659215ff18e5482d651
{% endblock %}

{% block lib_deps %}
lib/c
lib/sndfile
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block skip_dirs %}0{% endblock %}
