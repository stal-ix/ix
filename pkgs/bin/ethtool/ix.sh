{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/software/network/ethtool/ethtool-6.14.tar.xz
sha:9338bb00e492878d3bbe3cd2894e60db35813634c208db0b20f5c7ee84da69b1
{% endblock %}

{% block bld_libs %}
lib/c
lib/mnl
lib/kernel
{% endblock %}
