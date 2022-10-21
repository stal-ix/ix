{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/knik0/faad2/archive/refs/tags/2.10.1.tar.gz
sha:4c16c71295ca0cbf7c3dfe98eb11d8fa8d0ac3042e41604cfd6cc11a408cf264
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
