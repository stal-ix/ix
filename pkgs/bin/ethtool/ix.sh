{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/software/network/ethtool/ethtool-6.2.tar.xz
sha:86df0114064d4d73f6bf72bf03e85c33964a519ee0c1d1ba65005ad2d0e570e1
{% endblock %}

{% block bld_libs %}
lib/c
lib/mnl
lib/kernel
{% endblock %}
