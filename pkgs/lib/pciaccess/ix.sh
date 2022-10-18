{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/freedesktop/xorg-libpciaccess/archive/refs/tags/libpciaccess-0.17.tar.gz
sha:16086781a9e7dd88de51ecbcee5f7bb904e037aa46982a5ec42b52f4cf3dc4b6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/auto/conf/xorg
{% endblock %}
