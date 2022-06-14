{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/software/network/ethtool/ethtool-5.18.tar.xz
sha:9577b2ffbce710b659fb239598ec92bced1ca400ca0f1286762bfa44e4784270
{% endblock %}

{% block bld_libs %}
lib/c
lib/mnl
lib/linux
{% endblock %}
