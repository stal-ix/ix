{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/troglobit/sysklogd/archive/refs/tags/v2.7.0.tar.gz
sha:0fa92875e15260ab3fe989b2cae67134fc94570637bbc713108ce533c5a2e8f2
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
