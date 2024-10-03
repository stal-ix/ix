{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/jirka-h/haveged/archive/refs/tags/v1.9.19.tar.gz
sha:acbb05776668657012273be9bb3310e3140b79959aa4538e4cca8d30d40c0b8f
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
