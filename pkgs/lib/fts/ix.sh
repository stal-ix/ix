{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/void-linux/musl-fts/archive/refs/tags/v1.2.7.tar.gz
sha:49ae567a96dbab22823d045ffebe0d6b14b9b799925e9ca9274d47d26ff482a6
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
