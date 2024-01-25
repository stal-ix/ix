{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/benhoyt/inih/archive/refs/tags/r58.tar.gz
sha:e79216260d5dffe809bda840be48ab0eec7737b2bb9f02d2275c1b46344ea7b7
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
