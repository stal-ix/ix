{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.bz2
sha:b6ae1ee2fa3d42ac489287d3ec34c5885730b1296f0801ae577a35193d3affbc
{% endblock %}

{% block lib_deps %}
lib/c
lib/xiph/ogg
lib/xiph/vorbis
{% endblock %}
