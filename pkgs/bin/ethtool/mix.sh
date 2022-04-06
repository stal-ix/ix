{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/software/network/ethtool/ethtool-5.17.tar.xz
sha:64ab914b9c6b45047245d91f40b8760b2728992a9e5af22717c644238e889133
{% endblock %}

{% block bld_libs %}
lib/c
lib/mnl
lib/linux
{% endblock %}
