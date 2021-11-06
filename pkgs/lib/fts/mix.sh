{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/void-linux/musl-fts/archive/refs/tags/v1.2.7.tar.gz
bce0b5de0cf2519a74fbfacead60369d
{% endblock %}

{% block bld_deps %}
dev/build/autoconf/2.71/mix.sh
dev/build/automake/1.16.3/mix.sh
env/autohell/mix.sh
{% endblock %}

{% block autoreconf %}
dash ./bootstrap.sh
{% endblock %}
