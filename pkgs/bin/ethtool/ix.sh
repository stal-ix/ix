{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ethtool
{% endblock %}

{% block version %}
7.2
{% endblock %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/software/network/ethtool/ethtool-{{self.version().strip()}}.tar.xz
44256ddf4631ed08d816b7b8725f4b2e0f05e96b8c7ca64ee5c81449da2b6507
{% endblock %}

{% block bld_libs %}
lib/c
lib/mnl
lib/kernel
{% endblock %}
