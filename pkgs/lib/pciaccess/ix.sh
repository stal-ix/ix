{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/archive/libpciaccess-0.17/libpciaccess-libpciaccess-0.17.tar.bz2
sha:6e6d69d3cf5ee294dcb38ccfb360f1895a263df5dd8058563cdee62d9b9c17fd
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/auto/conf/xorg
{% endblock %}
