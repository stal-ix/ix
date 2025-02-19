{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/software/network/ethtool/ethtool-6.11.tar.xz
sha:8d91f5c72ae3f25b7e88d4781279dcb320f71e30058914370b1c574c96b31202
{% endblock %}

{% block bld_libs %}
lib/c
lib/mnl
lib/kernel
{% endblock %}
