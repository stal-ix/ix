{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/numactl/numactl/archive/refs/tags/v2.0.14.tar.gz
sha:1ee27abd07ff6ba140aaf9bc6379b37825e54496e01d6f7343330cf1a4487035
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}
