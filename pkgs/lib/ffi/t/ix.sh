{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/libffi/libffi/archive/refs/tags/v3.4.8.tar.gz
sha:cbb7f0b3b095dc506387ec1e35b891bfb4891d05b90a495bc69a10f2293f80ff
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}
