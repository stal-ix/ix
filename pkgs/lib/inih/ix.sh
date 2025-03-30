{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/benhoyt/inih/archive/refs/tags/r59.tar.gz
sha:062279922805f5e9a369551a08d5ddb506140fe50774183ffdbb7c22bb97e3f4
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
