{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/libuv/libuv/archive/refs/tags/v1.42.0.tar.gz
3f8ede5f30e6cc68b4e6f7d366dc9f00
{% endblock %}

{% block bld_tool %}
dev/build/auto/conf/2/69
dev/build/auto/make/1/16
{% endblock %}

{% block autoreconf %}
dash autogen.sh
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
