{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/void-linux/musl-fts/archive/refs/tags/v1.2.7.tar.gz
bce0b5de0cf2519a74fbfacead60369d
{% endblock %}

{% block conv_ver %}
2/71
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
