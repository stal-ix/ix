{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/numactl/numactl/archive/refs/tags/v2.0.18.tar.gz
sha:8cd6c13f3096e9c2293c1d732f56e2aa37a7ada1a98deed3fac7bd6da1aaaaf6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block patch %}
rm autogen.sh
{% endblock %}
