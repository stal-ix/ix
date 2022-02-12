{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/software/network/ethtool/ethtool-5.16.tar.xz
sha:aa2fef1936dd4a11755dfa0bdb93f0ec5bea45208d27c9754bc3abe1aa42c1cb
{% endblock %}

{% block bld_libs %}
lib/c
lib/mnl
lib/linux
{% endblock %}
