{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/libtom/libtommath/releases/download/v1.2.0/ltm-1.2.0.tar.xz
sha:b7c75eecf680219484055fcedd686064409254ae44bc31a96c5032843c0e18b1
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
