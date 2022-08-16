{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/lz4/lz4/archive/refs/tags/v1.9.4.tar.gz
sha:0b0e3aa07c8c063ddf40b082bdf7e37a1562bda40a0ff5272957f3e987e0e54b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
