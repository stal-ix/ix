{% extends '//die/autorehell.sh' %}

{% block fetch %}
#https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/archive/libpciaccess-0.16/libpciaccess-libpciaccess-0.16.tar.bz2
#sha:8a86df9cfbdc5527e95f789eee0212928324a69bc6ca69d24d0a5cf8744cb467
https://github.com/freedesktop/xorg-libpciaccess/archive/refs/tags/libpciaccess-0.16.tar.gz
sha:eed3edf8080d325bf9ac046969cd085db9e85f6f06c3ad255f615e06ff47b6de
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/auto/conf/xorg
{% endblock %}
