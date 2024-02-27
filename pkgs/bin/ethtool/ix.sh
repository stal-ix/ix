{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/software/network/ethtool/ethtool-6.7.tar.xz
sha:c3ae526b01ce4d8df6c794ab170de4a4104d111ea8d8db3f1fd7c25fcb905619
{% endblock %}

{% block bld_libs %}
lib/c
lib/mnl
lib/kernel
{% endblock %}
