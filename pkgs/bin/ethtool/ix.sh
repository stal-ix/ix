{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ethtool
{% endblock %}

{% block version %}
6.15
{% endblock %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/software/network/ethtool/ethtool-{{self.version().strip()}}.tar.xz
9477c365114d910120aaec5336a1d16196c833d8486f7c6da67bedef57880ade
{% endblock %}

{% block bld_libs %}
lib/c
lib/mnl
lib/kernel
{% endblock %}
