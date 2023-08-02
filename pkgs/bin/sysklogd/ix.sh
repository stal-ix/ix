{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/troglobit/sysklogd/archive/refs/tags/v2.5.1.tar.gz
sha:d7d53af5378fe325e7df0261d56a2f81271129fcabf4fe50e6c61f92c3ae071b
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
