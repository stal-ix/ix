{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/libffi/libffi/archive/refs/tags/v3.4.7.tar.gz
sha:f07c08c9c14977eafb9b5f9277713d91358ec18fc8aaa5607d6790cde90cba12
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
