{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ethtool
{% endblock %}

{% block version %}
7.1
{% endblock %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/software/network/ethtool/ethtool-{{self.version().strip()}}.tar.xz
4d78c26edc0255bc92f4b995b5fd66108d75ff966ed4694f6025a6d370bc2496
{% endblock %}

{% block bld_libs %}
lib/c
lib/mnl
lib/kernel
{% endblock %}
